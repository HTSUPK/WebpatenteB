import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/base/base_stateful_widget.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Widgets/answer_button_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../resources/image_resources.dart';
import 'ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends BaseStatefulWidgetState<QuizScreen> {
  String minuteString = "00", secondString = "00";
  int minutes = 0, seconds = 0, isSelect = 0;
  late Timer _timer;
  double progress = 0;

  @override
  void initState() {
    // TODO: implement initState
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _startSecond();
      totalProgressTime();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  void _startSecond() {
    setState(() {
      if (seconds < 59) {
        seconds++;
        secondString = seconds.toString();
        if (secondString.length == 1) {
          secondString = "0$secondString";
        }
      } else {
        _startMinute();
      }
    });
  }

  void _startMinute() {
    setState(() {
      if (minutes < 59) {
        seconds = 0;
        secondString = "00";
        minutes++;
        minuteString = minutes.toString();
        if (minuteString.length == 1) {
          minuteString = "0$minuteString";
        }
      }
    });
  }

  int giveMinute = 10;

  totalProgressTime() {
    int currentSecond = int.parse(secondString) + (int.parse(minuteString) * 60);
    progress = currentSecond / (giveMinute * 60);
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 142.h,
          color: colorPrimary,
          child: Column(
            children: [
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
                              value: progress,
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
                                  text: "$minuteString:$secondString",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          // Positioned(
                          //   top: 10,
                          //   left: 10,
                          //   child: TextWidget(
                          //     text: "$minuteString:$secondString",
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 34.h,
                    //   width: 282.w,
                    //   decoration: BoxDecoration(
                    //     color: colorDarkGreen,
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTRB(6, 4, 150, 4),
                    //     child: Container(
                    //       // width: 117.w,
                    //       height: 25.h,
                    //       decoration: BoxDecoration(
                    //         color: colorTimeBackground,
                    //         borderRadius: BorderRadius.circular(50),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(6),
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             const Icon(
                    //               Icons.watch_later_outlined,
                    //               size: 18,
                    //             ),
                    //             widthBox(5.w),
                    //             TextWidget(
                    //               text: "$minuteString:$secondString",
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
              ),
              heightBox(40.h),
              SizedBox(
                height: 44,
                width: screenSize.width,
                child: ListView.builder(
                    itemCount: 30,
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
                              color: isSelect == index ? colorTimeBackground : colorDarkGreen,
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
        ),
        Expanded(
          child: Container(
            width: screenSize.width,
            color: colorBackground,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        icQuizImage,
                        height: 245.h,
                        width: 310.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: TextWidget(
                        text: "How do you specify units in the CSS?. What are the different ways to do it? ",
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // heightBox(100.h),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(icSound),
                        TextWidget(
                          text: "3 of 30",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    // TODO: implement buildBottomNavigationBar
    return Container(
      color: colorBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnswerButton(
              text: "True",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResultScreen(),
                ),
              ),
            ),
            const AnswerButton(
              text: "False",
            )
          ],
        ),
      ),
    );
  }
}
