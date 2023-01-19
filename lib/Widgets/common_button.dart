import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import '../resources/color_resources.dart';
import '../resources/strings.dart';

class CommonButton extends StatelessWidget {
  final double? width,height;
  final String? text;
  final String? stringAssetName;
  final GestureTapCallback? onTap;
  final bool showLoading;
  final bool isIcon;
  final bool isTrailingIcon;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? assetHeight;
  final double? assetWidth;
  final double? fontSize;
  final double borderWidth;
  final Widget? iconWidget;
  final EdgeInsetsGeometry? buttonMargin;

  const CommonButton(
      {Key? key,
      this.width,
      this.height,
      this.text,
      this.onTap,
      this.showLoading = false,
      this.textColor,
      this.verticalPadding,
      this.stringAssetName,
      this.isIcon = false,
      this.assetWidth,
      this.assetHeight,
      this.fontSize,
      this.horizontalPadding,
      this.borderColor,
      this.borderRadius,
      this.backgroundColor,
      this.borderWidth = 1.0,
      this.iconWidget,
      this.buttonMargin,
      this.isTrailingIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height ?? 50.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? colorPrimary,
            borderRadius: BorderRadius.circular(borderRadius ?? 15.0),
            boxShadow: [
              BoxShadow(
                color: backgroundColor != null ? backgroundColor!.withOpacity(.36) : colorPrimary.withOpacity(.36),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
              BoxShadow(color: Colors.grey.shade300),
              BoxShadow(color: Colors.grey.shade300)
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 15, horizontal: horizontalPadding ?? 0.0),
            child: Center(
              child: showLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: colorWhite,
                        strokeWidth: 3,
                      ),
                    )
                  : isIcon
                      ? Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 34.0, right: 30),
                              child: SvgPicture.asset(
                                stringAssetName!,
                                height: assetHeight,
                                width: assetWidth,
                              ),
                            ),
                            TextWidget(
                              text: text,
                              fontSize: fontSize ?? 14.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: strFontName,
                              color: textColor ?? colorWhite,
                            ),
                          ],
                        )
                      : isTrailingIcon
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Spacer(),
                                TextWidget(
                                  text: "text",
                                  fontSize: fontSize ?? 14.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: strFontName,
                                  color: Colors.transparent,
                                ),
                                TextWidget(
                                  text: text,
                                  fontSize: fontSize ?? 14.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: strFontName,
                                  color: textColor ?? colorWhite,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: iconWidget!,
                                ),
                              ],
                            )
                          : TextWidget(
                              text: text,
                              fontSize: fontSize ?? 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: strFontName,
                              color: textColor ?? colorWhite,
                            ),
            ),
          )),
    );
  }
}
