import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/base/base_stateful_widget.dart';
import 'package:webpatente/resources/color_resources.dart';

import '../../Widgets/text_widget.dart';
import '../../Widgets/webPatentPro_widget.dart';
import '../../resources/image_resources.dart';

class WebPatenteProScreen extends StatefulWidget {
  const WebPatenteProScreen({Key? key}) : super(key: key);

  @override
  State<WebPatenteProScreen> createState() => _WebPatenteProScreenState();
}

class _WebPatenteProScreenState extends BaseStatefulWidgetState<WebPatenteProScreen> {
  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorPrimary;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 417.h,
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
                      text: "Web Patente Pro",
                      fontSize: 21,
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
              heightBox(13.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Image.asset(
                      icIconVip,
                      height: 190.h,
                      width: 192.w,
                      fit: BoxFit.cover,
                    ),
                    heightBox(39.h),
                    TextWidget(
                      text: "Lorem Ipsum is simply dummy text",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: colorWhite,
                    ),
                    heightBox(14.h),
                    TextWidget(
                      text: "Lorem Ipsum is simply dummy text of the printing and type setting industry.",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: colorWhite,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenSize.width,
            color: colorBackground,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: WebPatentProWidget(
                    monthText: "1 month",
                    priceText: "\$5 Per Month",
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
