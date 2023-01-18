import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webpatente/Widgets/text_widget.dart';

import '../resources/color_resources.dart';
import '../resources/image_resources.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? prefixIconName, prefixIcon, backIcon;
  final double? backIconHeight, backIconWidth;
  final bool? shouldShowBackButton;
  final PreferredSizeWidget? bottom;
  final bool? isPrefixIcon;
  final Widget? leading;
  final Widget? prefixWidget;
  final bool automaticallyImplyLeading;
  final GestureTapCallback? onTapPrefix;
  final GestureTapCallback? onPressBack;
  final Color? statusBarColor, backgroundColor;
  final GestureTapCallback? onTapAction;

  const CommonAppBar(
      {Key? key,
      required this.title,
      this.shouldShowBackButton = true,
      this.backIcon,
      this.backIconHeight,
      this.backIconWidth,
      this.bottom,
      this.isPrefixIcon,
      this.prefixIcon,
      this.prefixIconName,
      this.onTapPrefix,
      this.onPressBack,
      this.automaticallyImplyLeading = true,
      this.leading,
      this.statusBarColor,
      this.prefixWidget,
      this.backgroundColor,
      this.onTapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: colorWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: backgroundColor ?? colorPrimary,
      elevation: 0.0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: 60.h,
      title: TextWidget(
        text: title,
        color: colorWhite,
        fontWeight: FontWeight.w700,
        fontSize: 21.sp,
      ),
      centerTitle: true,
      leading: (shouldShowBackButton ?? true)
          ? leading ??
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onPressBack ??
                    () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                child: Container(
                  // height: 5,
                  // width: 5,
                  margin: const EdgeInsets.only(left: 10),
                  // padding: const EdgeInsets.only(bottom: 12, right: 5, left: 5, top: 10),
                  child: Image.asset(
                    backIcon!,
                    fit: BoxFit.cover,
                    height: backIconHeight ?? 37.h,
                    width: backIconWidth ?? 37.w,
                  ),
                  // child: SvgPicture.asset(icArrowLeft, color: colorWhite),
                ),
              )
          : null,
      leadingWidth: 55,
      actions: [
        prefixIconName != null
            ? Container(
                margin: EdgeInsets.only(right: 15.w),
                padding: const EdgeInsets.only(right: 5, left: 5, top: 25),
                child: TextWidget(
                  text: prefixIconName,
                  color: colorWhite,
                  fontSize: 14.sp,
                  onTap: onTapAction,
                ),
              )
            : prefixIcon != null
                ? GestureDetector(
                    onTap: onTapAction,
                    child: Container(
                      margin: const EdgeInsets.only(right: 22),
                      // padding:  EdgeInsets.only(right: 5, left),
                      child: SvgPicture.asset(prefixIcon!),
                    ),
                  )
                : prefixWidget ?? SizedBox.shrink(),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
