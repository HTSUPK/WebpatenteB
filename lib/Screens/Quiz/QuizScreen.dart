import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/base/base_stateful_widget.dart';
import 'package:webpatente/resources/color_resources.dart';

import '../../Widgets/answer_button_widget.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/text_widget.dart';
import '../../resources/image_resources.dart';
import 'ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends BaseStatefulWidgetState<QuizScreen> {
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
                    Container(
                      height: 34.h,
                      width: 282.w,
                      decoration: BoxDecoration(
                        color: colorDarkGreen,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Image.asset(
                      icClose,
                      fit: BoxFit.fitWidth,
                      height: 35.h,
                      width: 35.w,
                    ),
                  ],
                ),
              ),
              heightBox(40.h),
              SizedBox(
                height: 44.h,
                width: screenSize.width,
                child: ListView.builder(
                    itemCount: 30,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Container(
                          height: 44.h,
                          width: 44.w,
                          decoration: BoxDecoration(
                            color: colorDarkGreen,
                            borderRadius: BorderRadius.circular(44),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: "${index + 1}",
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: colorWhite,
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
