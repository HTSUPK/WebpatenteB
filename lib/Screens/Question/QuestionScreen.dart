import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Models/ChapterList_Model.dart';
import '../../Providers/question_provider.dart';
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
  // final List<String> _locations = ['Legends Of USA', 'B', 'C', 'D'];
  // String _selectedLocation = 'A';

  /// Language ///

  // String dropDownValue = 'Hindi';
  List<String> dropDownValue = ['Hindi'];

  // List of items in our dropdown menu
  var items = [
    'Hindi',
    'English',
  ];

  late QuestionProvider questionProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    questionProviderRef = Provider.of<QuestionProvider>(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      questionProviderRef.callApiQuestion();
      questionProviderRef.callApiChapterList();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      questionProviderRef.initLanguages();
    });
    // _selectedLocation = _locations[0];
    super.initState();
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<QuestionProvider>(builder: (_, questionProviderRef, __) {
      return questionProviderRef.questionLoader
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  Container(
                    height: 170.h,
                  ),
                  Expanded(
                    child: Container(
                      color: colorBackground,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 120.h,
                            );
                          }),
                    ),
                  )
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 164.h,
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
                                width: screenSize.width / 2,
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
                                      TextWidget(
                                        text: questionProviderRef.selectChapter,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: colorWhite,
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
                                    });
                                  },
                                ),
                                // Theme(
                                //   data: Theme.of(context).copyWith(
                                //     canvasColor: colorRightIcon,
                                //   ),
                                //   child: DropdownButtonHideUnderline(
                                //     child: DropdownButton(
                                //       iconEnabledColor: colorWhite,
                                //       elevation: 0,
                                //       isDense: true,
                                //       value: _selectedLocation,
                                //       items: _locations.map((accountType) {
                                //         return DropdownMenuItem(
                                //           value: accountType,
                                //           child: TextWidget(
                                //             text: accountType,
                                //             fontSize: 17,
                                //             fontWeight: FontWeight.w600,
                                //             color: colorWhite,
                                //           ),
                                //         );
                                //       }).toList(),
                                //       onChanged: (val) {
                                //         setState(() {
                                //           _selectedLocation = val!;
                                //         });
                                //       },
                                //     ),
                                //   ),
                                // ),
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
                      heightBox(12.h),
                      TextWidget(
                        text: "Solutions of the group of quiz n. 362",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: colorWhite,
                      ),
                      heightBox(12.h),
                      Row(
                        children: [
                          Image.asset(
                            icPreviewButton,
                            fit: BoxFit.cover,
                            height: 51.h,
                            width: 51.w,
                          ),
                          Image.asset(
                            icNextButton,
                            fit: BoxFit.cover,
                            height: 51.h,
                            width: 51.w,
                          ),
                          widthBox(10.w),
                          SizedBox(
                            width: 132.w,
                            height: 50.h,
                            child: TextEditingWidget(
                              width: 132.w,
                              height: 50.h,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              labelText: "Write Page No",
                              labelSize: 16,
                              labelColor: colorBlack.withOpacity(0.5),
                              fontSize: 16,
                              onEditingComplete: () => FocusScope.of(context).nextFocus(),
                            ),
                          ),
                          widthBox(5.w),
                          Container(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            child: TextWidget(
                              text: "Go",
                              color: colorBlack.withOpacity(0.5),
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: colorBackground,
                    child: ListView.builder(
                      itemCount: questionProviderRef.questionList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 0),
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
                                    GestureDetector(
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
                                          // "https://hexeros.com/dev/superapp/uploads/user/user.png",
                                          questionProviderRef.questionList[index].image!,
                                          height: 55.h,
                                          width: 70.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    widthBox(10.w),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                text: questionProviderRef.questionList[index].question,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                maxLines: 3,
                                              ),
                                              heightBox(5.h),
                                              Row(
                                                children: [
                                                  QuestionItem(
                                                    iconName: icSpeak,
                                                    text: "Speak",
                                                    onTap: () async {
                                                      setState(() {
                                                        questionProviderRef.text = questionProviderRef.questionList[index].question!;
                                                        setState(() {});
                                                      });
                                                      questionProviderRef.speak();
                                                    },
                                                  ),
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
                                              text: questionProviderRef.questionList[index].ans == "1" ? "T" : "F",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: colorWhite,
                                            ),
                                          ),
                                        ),
                                      ],
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
                                                value: questionProviderRef.dropDownValue[index],
                                                isDense: true,
                                                icon: const Icon(Icons.keyboard_arrow_down),
                                                items: questionProviderRef.items.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    questionProviderRef.dropDownValue[index] = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          heightBox(8.h),
                                          TextWidget(
                                            text: "Hindi: कहानी के लिए समय अवधि या सेटिंग कितनी महत्वपूर्ण थी?",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
