import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_resources.dart';
import '../resources/strings.dart';

class TextEditingWidget extends StatelessWidget {
  final String? hint, initialValue, fontFamilyText, fontFamilyHint, counterText, prefixIconName;
  final Widget? prefixIcon;
  final Color? color;
  final Color? hintColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool? isDense;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapSuffixIcon;
  final double? height;
  final double? width;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isShadowEnable;
  final bool isBorderEnable;
  final FontWeight? fontWeightText;
  final FontWeight? fontWeightHint;
  final String? suffixIconName;
  final Widget? suffixIconWidget;
  final double? suffixIconHeight;
  final double? suffixIconWidth;
  final bool passwordVisible;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final bool autoFocus;
  final bool expands;
  final double? fontSize, hintSize, borderRadius, contentPaddingHorizontal, contentPaddingVertical;
  final BoxConstraints? prefixIconConstraints;

  const TextEditingWidget(
      {Key? key,
      this.hint,
      this.hintSize,
      this.expands = false,
      this.autoFocus = false,
      this.prefixIconConstraints,
      this.prefixIconName,
      this.prefixIcon,
      this.color,
      this.controller,
      this.focusNode,
      this.initialValue,
      this.readOnly,
      this.textAlign,
      this.suffixIcon,
      this.textInputType,
      this.maxLines = 1,
      this.isDense,
      this.onTap,
      this.height,
      this.onFieldSubmitted,
      this.validator,
      this.maxLength,
      this.textInputAction,
      this.inputFormatters,
      this.width,
      this.hintColor,
      this.isBorderEnable = true,
      this.isShadowEnable = true,
      this.fontFamilyText,
      this.fontFamilyHint,
      this.fontWeightHint,
      this.fontWeightText,
      this.suffixIconName,
      this.suffixIconHeight,
      this.suffixIconWidth,
      this.onTapSuffixIcon,
      this.passwordVisible = false,
      this.suffixIconWidget,
      this.onChanged,
      this.onEditingComplete,
      this.counterText,
      this.borderRadius,
      this.fontSize,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          isShadowEnable
              ? BoxShadow(
                  color: colorBlack.withOpacity(0.10),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(2, 2), // changes position of shadow
                )
              : const BoxShadow(
                  color: Colors.transparent,
                ),
        ],
      ),
      child: TextFormField(
        autofocus: autoFocus,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        validator: validator,
        onTap: onTap,
        obscureText: passwordVisible,
        maxLength: maxLength,
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        initialValue: initialValue,
        readOnly: readOnly ?? false,
        maxLines: maxLines,
        textAlign: textAlign ?? TextAlign.left,
        keyboardType: textInputType,
        expands: expands,
        style: TextStyle(
          color: colorBlack,
          fontSize: fontSize ?? 14.sp,
          fontFamily: fontFamilyText ?? strFontName,
          fontWeight: fontWeightText ?? FontWeight.w500,
        ),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          enabled: true,
          counterText: counterText ?? "",
          isDense: isDense ?? isDense,
          prefixIcon: prefixIconName?.isNotEmpty ?? false
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SvgPicture.asset(prefixIconName!),
                )
              : prefixIcon,
          suffixIcon: suffixIconWidget ??
              (suffixIconName != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onTapSuffixIcon,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SvgPicture.asset(suffixIconName!),
                      ))
                  : null),
          hintText: hint,
          errorMaxLines: 2,
          contentPadding: EdgeInsets.symmetric(horizontal: contentPaddingHorizontal ?? 12.w, vertical: contentPaddingVertical ?? 12.h),
          hintStyle: TextStyle(
            color: hintColor ?? Color(0xFF3B3B3B).withOpacity(0.5),
            fontSize: hintSize ?? 14.sp,
            fontFamily: fontFamilyHint ?? strFontName,
            fontWeight: fontWeightHint ?? FontWeight.w300,
          ),
          filled: true,
          prefixIconConstraints: prefixIconConstraints,
          fillColor: color ?? Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius ?? 16.0), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
