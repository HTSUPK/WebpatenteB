import 'package:flutter/material.dart';

import '../resources/color_resources.dart';
import '../resources/strings.dart';

class TextWidget extends StatefulWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? textHeight;
  final TextStyle? textStyle;
  final TextDecoration? decoration;

  TextWidget({
    this.text,
    this.color = colorBlack,
    this.fontSize,
    this.fontFamily = strFontName,
    this.letterSpacing,
    this.textAlign,
    this.onTap,
    this.fontWeight = FontWeight.normal,
    this.textOverflow,
    this.maxLines,
    this.textHeight,
    this.textStyle,
    this.decoration,
  });

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Text(
        widget.text ?? "",
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        softWrap: true,
        overflow: widget.textOverflow,
        style: widget.textStyle ??
            TextStyle(
              color: widget.color,
              height: widget.textHeight,
              fontSize: widget.fontSize ?? 14,
              letterSpacing: widget.letterSpacing,
              decoration: widget.decoration,
              fontFamily: widget.fontFamily ?? "Metropolis-Regular",
              fontWeight: widget.fontWeight,
            ),
      ),
    );
  }
}
