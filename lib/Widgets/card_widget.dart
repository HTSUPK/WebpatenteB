import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import 'package:webpatente/resources/color_resources.dart';

import '../resources/strings.dart';
import 'common_widgets.dart';

class CardWidget extends StatefulWidget {
  final String? imageName, textName;
  final double? width, height, imageWidth, imageHeight, textSize;
  final Color? backgroundColor;
  final GestureTapCallback? onTap;

  const CardWidget({
    super.key,
    this.imageName,
    this.textName,
    this.width,
    this.height,
    this.imageHeight,
    this.imageWidth,
    this.backgroundColor,
    this.textSize,
    this.onTap,
  });

  // const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 150.h,
        width: widget.width ?? 144.w,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? colorWhite,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageName!,
              height: 86.h,
              width: 86.w,
            ),
            heightBox(12.h),
            TextWidget(
              text: widget.textName!,
              fontSize: widget.textSize ?? 15,
              fontFamily: strFontName,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
