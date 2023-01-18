import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/common_appbar.dart';
import 'package:webpatente/resources/color_resources.dart';

import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends BaseStatefulWidgetState<StatisticsScreen> {
  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return const CommonAppBar(
      title: "Statistics",
      backIcon: icArrowLeft,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          width: screenSize.width,
          color: colorPrimary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              heightBox(35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextWidget(
                          text: "140",
                          fontWeight: FontWeight.w800,
                          color: colorWhite,
                          fontSize: 25.sp,
                        ),
                        TextWidget(
                          text: "Correct",
                          fontWeight: FontWeight.w500,
                          color: colorWhite,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "20",
                          fontWeight: FontWeight.w800,
                          color: colorWhite,
                          fontSize: 25.sp,
                        ),
                        TextWidget(
                          text: "Not Answered",
                          fontWeight: FontWeight.w500,
                          color: colorWhite,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "90",
                          fontWeight: FontWeight.w800,
                          color: colorWhite,
                          fontSize: 25.sp,
                        ),
                        TextWidget(
                          text: "Incorrect",
                          fontWeight: FontWeight.w500,
                          color: colorWhite,
                          fontSize: 14.sp,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              heightBox(32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextWidget(
                          text: "60%",
                          fontWeight: FontWeight.w800,
                          color: colorWhite,
                          fontSize: 25.sp,
                        ),
                        TextWidget(
                          text: "Total Passed",
                          fontWeight: FontWeight.w500,
                          color: colorWhite,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "40%",
                          fontWeight: FontWeight.w800,
                          color: colorWhite,
                          fontSize: 25.sp,
                        ),
                        TextWidget(
                          text: "Total Failed",
                          fontWeight: FontWeight.w500,
                          color: colorWhite,
                          fontSize: 14.sp,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenSize.width,
            color: colorWhite,
            child: Column(
              children: [
                heightBox(31.h),
                TextWidget(
                  text: "Quiz Performance",
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
