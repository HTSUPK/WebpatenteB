import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/text_widget.dart';

import '../resources/color_resources.dart';

class AnswerButton extends StatefulWidget {
  final String? text;
  final Color? backgroundColor;
  final GestureTapCallback? onTap;

  const AnswerButton({
    super.key,
    this.text,
    this.backgroundColor,
    this.onTap,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        height: 60.h,
        width: 167.w,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? colorAnsBackGround,
          borderRadius: BorderRadius.circular(11),
        ),
        child: TextWidget(
          text: widget.text,
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: colorWhite,
        ),
      ),
    );
  }
}
