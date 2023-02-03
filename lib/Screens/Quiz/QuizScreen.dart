import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Providers/question_provider.dart';
import '../../Providers/quiz_provider.dart';
import '../../Widgets/answer_button_widget.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import 'ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  final String? where;
  final List? selectChapterId;

  const QuizScreen({
    super.key,
    this.where,
    this.selectChapterId,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends BaseStatefulWidgetState<QuizScreen> {
  int isSelect = 0;

  late QuizProvider quizProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    isSelect = 0;
    quizProviderRef = Provider.of<QuizProvider>(context, listen: false);
    quizProviderRef.quizType = widget.where;
    if (widget.where == "full") {
      Future.delayed(const Duration(seconds: 0), () {
        Map<String, dynamic> body = {
          "limit": "",
          "offset": "",
        };
        quizProviderRef.callApiFullQuiz(body);
      });
    } else if (widget.where == "selected") {
      Future.delayed(const Duration(seconds: 0), () {
        String selectId = "";
        for (int i = 0; i < widget.selectChapterId!.length; i++) {
          selectId = "$selectId${widget.selectChapterId![i]},";
        }
        Map<String, dynamic> body = {
          "limit": "",
          "offset": "",
          "chapter_id": selectId,
        };
        quizProviderRef.callApiSelectedQuiz(body);
      });
    }
    quizProviderRef.progress = 0;
    quizProviderRef.minutes = 0;
    quizProviderRef.seconds = 0;
    quizProviderRef.minuteString = "00";
    quizProviderRef.secondString = "00";

    /// Start Timer ///
    quizProviderRef.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      quizProviderRef.startSecond();
      quizProviderRef.totalProgressTime(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    quizProviderRef.timer.cancel();
    super.dispose();
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => Provider.of<QuizProvider>(context).quizList.isNotEmpty ? colorPrimary : colorBackground;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return Provider.of<QuizProvider>(context).quizList.isNotEmpty
        ? null
        : CommonAppBar(
            backIcon: icArrowLeft,
            backIconHeight: 45.h,
            backIconWidth: 45.w,
            title: '',
            backgroundColor: colorBackground,
          );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<QuizProvider>(builder: (_, quizProviderRef, __) {
      return Column(
        children: [
          quizProviderRef.quizLoader
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[350]!,
                  child: Container(
                    color: colorBackground,
                    height: 142.h,
                    width: screenSize.width,
                  ),
                )
              : quizProviderRef.quizList.isNotEmpty
                  ? Container(
                      height: 142.h,
                      color: colorPrimary,
                      child: Column(
                        children: [
                          heightBox(10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 34.h,
                                  width: 282.w,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                                        child: LinearProgressIndicator(
                                          value: quizProviderRef.progress,
                                          valueColor: const AlwaysStoppedAnimation(colorTimeBackground),
                                          backgroundColor: colorDarkGreen,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              size: 18,
                                            ),
                                            widthBox(5.w),
                                            TextWidget(
                                              text: "${quizProviderRef.minuteString}:${quizProviderRef.secondString}",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      backgroundColor: colorPrimary,
                                      title: TextWidget(
                                        text: "Close Quiz",
                                        fontSize: 18,
                                        color: colorWhite,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      content: TextWidget(
                                        text: "Do you want to quit this quiz?",
                                        color: colorWhite,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: TextWidget(
                                            text: "No",
                                            color: colorWhite,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                          child: TextWidget(
                                            text: "Yes",
                                            color: colorWhite,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Navigator.pop(context),
                                  child: Image.asset(
                                    icClose,
                                    fit: BoxFit.fitWidth,
                                    height: 35.h,
                                    width: 35.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          heightBox(40.h),
                          SizedBox(
                            height: 44,
                            width: screenSize.width,
                            child: ListView.builder(
                                // itemCount: 30,
                                itemCount: quizProviderRef.quizList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelect = index;
                                        setState(() {});
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Container(
                                        height: 44,
                                        width: 44,
                                        decoration: BoxDecoration(
                                          color: isSelect == index
                                              ? colorTimeBackground
                                              : quizProviderRef.isSelectAnswerList[index].isAnswered == 1
                                                  ? colorDarkBlue
                                                  : colorDarkGreen,
                                          borderRadius: BorderRadius.circular(44),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text: "${index + 1}",
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: isSelect == index ? colorBlack : colorWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
          Expanded(
            child: quizProviderRef.quizLoader
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[350]!,
                    child: Container(
                      color: colorBackground,
                      width: screenSize.width,
                    ),
                  )
                : quizProviderRef.quizList.isNotEmpty
                    ? Container(
                        width: screenSize.width,
                        color: colorBackground,
                        child: Container(
                          width: screenSize.width,
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
                          decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          // icQuizImage,
                                          quizProviderRef.quizList[isSelect].image!,
                                          height: 245.h,
                                          width: 310.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      heightBox(5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                        child: TextWidget(
                                          text: quizProviderRef.quizList[isSelect].question,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      heightBox(20.h),
                                      // const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: colorWhite,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Provider.of<QuestionProvider>(context, listen: false).text = quizProviderRef.quizList[isSelect].question!;
                                            Provider.of<QuestionProvider>(context, listen: false).speak();
                                            setState(() {});
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          icSound,
                                        ),
                                      ),
                                      TextWidget(
                                        text: "${isSelect + 1} of ${quizProviderRef.quizList.length}",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        color: colorBackground,
                        child: Center(
                          child: TextWidget(
                            text: "No Quiz Found",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
          ),
        ],
      );
    });
  }

  /// Bottom Button ///
  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    // TODO: implement buildBottomNavigationBar
    return Provider.of<QuizProvider>(context).quizLoader
        ? Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[350]!,
            child: Container(
              height: 60.h,
              color: colorBackground,
            ),
          )
        : Provider.of<QuizProvider>(context).quizList.isNotEmpty
            ? Container(
                color: colorBackground,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnswerButton(
                              text: "True",
                              backgroundColor: quizProviderRef.isSelectAnswerList[isSelect].isAnswered == 1 ? colorDarkGreen : colorAnsBackGround,
                              onTap: () {
                                setState(() {
                                  quizProviderRef.onSelect("true", isSelect);
                                  if ((isSelect + 1) != quizProviderRef.quizList.length) {
                                    isSelect = isSelect + 1;
                                  }
                                  setState(() {});
                                });
                              }),
                          AnswerButton(
                            text: "False",
                            backgroundColor: quizProviderRef.isSelectAnswerList[isSelect].isAnswered == 1 ? colorRed : colorAnsBackGround,
                            onTap: () {
                              setState(() {
                                quizProviderRef.onSelect("false", isSelect);
                                if ((isSelect + 1) != quizProviderRef.quizList.length) {
                                  isSelect = isSelect + 1;
                                }
                                setState(() {});
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    (isSelect + 1) == quizProviderRef.quizList.length
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonButton(
                              text: "Finish",
                              fontSize: 18,
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultScreen(
                                              result: quizProviderRef.isSelectAnswerList,
                                              time: "${quizProviderRef.minuteString}:${quizProviderRef.secondString}",
                                            )));
                              },
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            : const SizedBox();
  }
}
