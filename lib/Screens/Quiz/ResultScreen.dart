import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/base/base_stateful_widget.dart';

import '../../Widgets/statistics_detail_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends BaseStatefulWidgetState<ResultScreen> {
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
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    TextWidget(
                      text: "Result (20:05)",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: colorWhite,
                    ),
                    const Spacer(),
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
              heightBox(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    StatisticsDetail(
                      detailText: "14",
                      detailFontSize: 32,
                      nameText: "Correct",
                      nameFontSize: 17,
                    ),
                    StatisticsDetail(
                      detailText: "2",
                      detailFontSize: 32,
                      nameText: "Not Answered",
                      nameFontSize: 17,
                    ),
                    StatisticsDetail(
                      detailText: "2",
                      detailFontSize: 32,
                      nameText: "Incorrect",
                      nameFontSize: 17,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenSize.width,
            color: colorBackground,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  "https://hexeros.com/dev/superapp/uploads/user/user.png",
                                  height: 55.h,
                                  width: 70.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              widthBox(10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: "1. How important was the time period or the setting to the story?",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      maxLines: 3,
                                    ),
                                    heightBox(7.h),
                                    TextWidget(
                                      text: "Your Answer: True",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: colorPrimary,
                                    ),
                                    heightBox(3.h),
                                    TextWidget(
                                      text: "Correct Answer: True",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        heightBox(8.h),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
