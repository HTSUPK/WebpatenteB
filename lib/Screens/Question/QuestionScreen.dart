import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import '../../Widgets/text_widget.dart';
import '../../resources/color_resources.dart';
import '../../utils/app_utils.dart';
import '../../Models/ChapterList_Model.dart';
import '../../Providers/question_provider.dart';
import '../../Widgets/chapterCard_widget.dart';
import '../../Widgets/questionItem_widget.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import 'PictureFullViewScreen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends BaseStatefulWidgetState<QuestionScreen> {
  TextEditingController pageNoController = TextEditingController();

  late QuestionProvider questionProviderRef;

  bool isPlaying = false;
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    questionProviderRef = Provider.of<QuestionProvider>(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      questionProviderRef.callApiChapterList();
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   questionProviderRef.initLanguages();
    // });

    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.playing;
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<QuestionProvider>(builder: (_, questionProviderRef, __) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          questionProviderRef.questionLoader
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 164.h,
                    color: colorBackground,
                  ),
                )
              : Container(
                  // height: 170.h,
                  color: colorPrimary,
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightBox(5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextWidget(
                                text: "Choose a topic",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorWhite,
                              ),
                              SizedBox(
                                height: 25,
                                width: screenSize.width / 1.5,
                                child: PopupMenuButton<ChapterList>(
                                  itemBuilder: (context) {
                                    return questionProviderRef.chapterList.map((value) {
                                      return PopupMenuItem(
                                        value: value,
                                        child: TextWidget(
                                          text: value.chapter,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: colorPrimary,
                                        ),
                                      );
                                    }).toList();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        width: screenSize.width / 2,
                                        child: TextWidget(
                                          text: questionProviderRef.selectChapter,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: colorWhite,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        color: colorWhite,
                                      ),
                                    ],
                                  ),
                                  onSelected: (v) {
                                    setState(() {
                                      questionProviderRef.selectChapter = v.chapter!;
                                      pageNoController.clear();
                                      questionProviderRef.questionFunction(v.id, v.page![0].sequence! ?? 1);
                                      print('ChapterId ${v.id} ${v.page![0].sequence!}');
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              icClose,
                              fit: BoxFit.fitWidth,
                              height: 35.h,
                              width: 35.w,
                            ),
                          ),
                        ],
                      ),
                      heightBox(10.h),
                      ReadMoreText(
                        questionProviderRef.pageList[questionProviderRef.currentPageNo - 1].title!,
                        trimLines: 1,
                        style: const TextStyle(
                          fontSize: 12,
                          color: colorWhite,
                          fontWeight: FontWeight.w600,
                        ),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: ' Show less',
                        moreStyle: const TextStyle(color: colorGoButton, fontSize: 14, fontWeight: FontWeight.w600),
                        lessStyle: const TextStyle(color: colorGoButton, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      /* TextWidget(
                        text: questionProviderRef.pageList[questionProviderRef.currentPageNo - 1].title,
                        // text: questionProviderRef.pageList[questionProviderRef.currentSequence - 1].title,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: colorWhite,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),*/
                      // heightBox(12.h),
                      TextWidget(
                        text: "Page no. : ${questionProviderRef.currentPageNo}",
                        // text: "Page no. : ${questionProviderRef.currentSequence}",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colorWhite,
                      ),
                      heightBox(12.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (questionProviderRef.currentPageNo != 1) {
                                questionProviderRef.currentPageNo = --questionProviderRef.currentPageNo;
                                var value =
                                    questionProviderRef.pageList.indexWhere((element) => element.sequence == questionProviderRef.currentPageNo);
                                questionProviderRef.currentChapterId = questionProviderRef.pageList[value].chapterId!;
                                questionProviderRef.selectChapter = questionProviderRef.pageList[value].chapter!.chapter!;
                                pageNoController.clear();
                                questionProviderRef.questionFunction(questionProviderRef.currentChapterId, questionProviderRef.currentPageNo);
                              }
                            },
                            child: Image.asset(
                              icPreviewButton,
                              fit: BoxFit.cover,
                              height: 51.h,
                              width: 51.w,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (questionProviderRef.pageList.length != questionProviderRef.currentPageNo) {
                                questionProviderRef.currentPageNo = ++questionProviderRef.currentPageNo;
                                var value =
                                    questionProviderRef.pageList.indexWhere((element) => element.sequence == questionProviderRef.currentPageNo);
                                questionProviderRef.currentChapterId = questionProviderRef.pageList[value].chapterId!;
                                questionProviderRef.selectChapter = questionProviderRef.pageList[value].chapter!.chapter!;
                                pageNoController.clear();
                                questionProviderRef.questionFunction(questionProviderRef.currentChapterId, questionProviderRef.currentPageNo);
                              } else {
                                AppUtils.toast("No more page", colorPrimary, colorWhite);
                              }
                            },
                            child: Image.asset(
                              icNextButton,
                              fit: BoxFit.cover,
                              height: 51.h,
                              width: 51.w,
                            ),
                          ),
                          widthBox(10.w),
                          SizedBox(
                            width: 132.w,
                            height: 50.h,
                            child: TextEditingWidget(
                              width: 132.w,
                              height: 50.h,
                              controller: pageNoController,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              labelText: "Write Page No",
                              labelSize: 16,
                              labelColor: colorBlack.withOpacity(0.5),
                              fontSize: 16,
                              onEditingComplete: () => FocusScope.of(context).unfocus(),
                            ),
                          ),
                          widthBox(5.w),
                          GestureDetector(
                            onTap: () {
                              if (pageNoController.text.isEmpty) {
                                AppUtils.toast("Please enter page number", colorRed, colorWhite);
                              } else {
                                var value =
                                    questionProviderRef.pageList.indexWhere((element) => element.sequence == int.parse(pageNoController.text));
                                questionProviderRef.currentChapterId = questionProviderRef.pageList[value].chapterId!;
                                questionProviderRef.selectChapter = questionProviderRef.pageList[value].chapter!.chapter!;
                                questionProviderRef.questionFunction(questionProviderRef.currentChapterId, int.parse(pageNoController.text));
                                // var value = questionProviderRef.pageList.indexWhere((element) => element.sequence == int.parse(pageNoController.text));
                                // if (value != -1) {
                                //   questionProviderRef.questionFunction(questionProviderRef.currentChapterId, questionProviderRef.pageList[value].id);
                                //   questionProviderRef.currentSequence =  questionProviderRef.pageList[value].sequence!;
                                //   print('ID ${questionProviderRef.pageList[value].id}');
                                // } else {
                                //   AppUtils.toast("No Page Available", colorRed, colorWhite);
                                // }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorGoButton,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorBlack.withOpacity(.13),
                                    spreadRadius: 10,
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              child: TextWidget(
                                text: "Go",
                                color: colorBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightBox(12.h),
                    ],
                  ),
                ),
          Expanded(
            child: Container(
              color: colorBackground,
              child: questionProviderRef.questionLoader
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                          // itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  heightBox(10),
                                  const ChapterCard(
                                    text: "",
                                    borderColor: colorWhite,
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  : questionProviderRef.questionList.isNotEmpty
                      ? ListView.builder(
                          itemCount: questionProviderRef.questionList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(8.w, 5.h, 8.w, 5.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // questionProviderRef.questionList[index].image == "" && questionProviderRef.questionList[index].image == null
                                        //     ? GestureDetector(
                                        //         onTap: () => Navigator.push(
                                        //           context,
                                        //           MaterialPageRoute(
                                        //             builder: (context) => PictureFullViewScreen(
                                        //               image: questionProviderRef.questionList[index].image!,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         child: ClipRRect(
                                        //           borderRadius: BorderRadius.circular(8),
                                        //           child: Image.network(
                                        //             questionProviderRef.questionList[index].image!,
                                        //             // "https://www.emca-online.eu/assets/images/dummy.png",
                                        //             height: 55.h,
                                        //             width: 70.w,
                                        //             fit: BoxFit.cover,
                                        //           ),
                                        //         ),
                                        //       )
                                        //     : SizedBox(),
                                        TextWidget(
                                          text: "${index + 1}.",
                                          // text: questionProviderRef.questionList[index].sequence!.toString(),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          maxLines: 3,
                                        ),
                                        widthBox(5.w),
                                        questionProviderRef.questionList[index].image != ""
                                            ? GestureDetector(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PictureFullViewScreen(
                                                      image: questionProviderRef.questionList[index].image!,
                                                    ),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: Image.network(
                                                    questionProviderRef.questionList[index].image!,
                                                    height: 55.h,
                                                    width: 70.w,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                        widthBox(10.w),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: questionProviderRef.questionList[index].image != "" ? 180.w : 250.w,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: questionProviderRef.questionList[index].question,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                      maxLines: 3,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    heightBox(5.h),
                                                    Row(
                                                      children: [
                                                        questionProviderRef.questionList[index].audio != "" &&
                                                                questionProviderRef.questionList[index].audio != null
                                                            ? QuestionItem(
                                                                iconName: icSpeak,
                                                                text: "Speak",
                                                                onTap: () async {
                                                                  /// AUDIO ///
                                                                  await audioPlayer.play(UrlSource(questionProviderRef.questionList[index].audio!));
                                                                  // await audioPlayer.play(UrlSource('https://www.kozco.com/tech/piano2-CoolEdit.mp3'));
                                                                  setState(() {});
                                                                  // setState(() {
                                                                  //   questionProviderRef.text = questionProviderRef.questionList[index].question!;
                                                                  //   setState(() {});
                                                                  // });
                                                                  // questionProviderRef.speak();
                                                                },
                                                              )
                                                            : const SizedBox(),
                                                        widthBox(10.w),
                                                        QuestionItem(
                                                          iconName: icTranslate,
                                                          text: "Translate",
                                                          onTap: () {
                                                            questionProviderRef.selectIndex(index);
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 44,
                                                width: 44,
                                                decoration: BoxDecoration(
                                                  color: questionProviderRef.questionList[index].ans == "1" ? colorDarkGreen : colorRed,
                                                  borderRadius: BorderRadius.circular(44),
                                                ),
                                                child: Center(
                                                  child: TextWidget(
                                                    text: questionProviderRef.questionList[index].ans == "1" ? "V" : "F",
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    color: colorWhite,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    questionProviderRef.selectTranslateIndex == index
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              heightBox(8.h),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  border: Border.all(color: colorBlack.withOpacity(0.22), style: BorderStyle.solid, width: 0.80),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    value: questionProviderRef.dropDownValue,
                                                    isDense: true,
                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                    items: questionProviderRef.items.map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: SizedBox(
                                                          child: Text(
                                                            items,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      setState(() {
                                                        // questionProviderRef.dropDownValue[index] = newValue!;
                                                        // if (questionProviderRef.dropDownValue[index] == "English") {
                                                        //   questionProviderRef.selectLanguageCode[index] =
                                                        //       questionProviderRef.questionList[index].languageTexts!.en!;
                                                        // } else if (questionProviderRef.dropDownValue[index] == "Hindi") {
                                                        //   questionProviderRef.selectLanguageCode[index] =
                                                        //       questionProviderRef.questionList[index].languageTexts!.hi!;
                                                        // } else if (questionProviderRef.dropDownValue[index] == "Urdu") {
                                                        //   questionProviderRef.selectLanguageCode[index] =
                                                        //       questionProviderRef.questionList[index].languageTexts!.ur!;
                                                        // }
                                                        questionProviderRef.dropDownValue = newValue!;
                                                        questionProviderRef.selectLanguageCode.clear();
                                                        for (int i = 0; i < questionProviderRef.questionList.length; i++) {
                                                          if (questionProviderRef.dropDownValue == "English") {
                                                            questionProviderRef.selectLanguageCode
                                                                .add(questionProviderRef.questionList[i].languageTexts!.en!);
                                                          }
                                                          if (questionProviderRef.dropDownValue == "Hindi") {
                                                            questionProviderRef.selectLanguageCode
                                                                .add(questionProviderRef.questionList[i].languageTexts!.hi!);
                                                          }
                                                          if (questionProviderRef.dropDownValue == "Urdu") {
                                                            questionProviderRef.selectLanguageCode
                                                                .add(questionProviderRef.questionList[i].languageTexts!.ur!);
                                                          }
                                                        }
                                                        setState(() {});
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              heightBox(8.h),
                                              SizedBox(
                                                width: 360.w,
                                                child: TextWidget(
                                                  text: questionProviderRef.selectLanguageCode[index],
                                                  textAlign: questionProviderRef.dropDownValue == "Urdu" ? TextAlign.end : TextAlign.start,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: TextWidget(
                          text: "No Question",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
            ),
          ),
        ],
      );
    });
  }
}
