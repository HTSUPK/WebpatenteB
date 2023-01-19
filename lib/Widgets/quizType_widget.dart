import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import '../resources/color_resources.dart';
import '../resources/image_resources.dart';
import '../resources/strings.dart';

class QuizType extends StatefulWidget {
  final String? name;
  // final Color? iconColor, borderColor;
  final bool? isSelect;
  final GestureTapCallback? onTap;

  const QuizType({
    super.key,
    this.name,
    // this.iconColor,
    // this.borderColor,
    this.isSelect,
    this.onTap,
  });

  @override
  State<QuizType> createState() => _QuizTypeState();
}

class _QuizTypeState extends State<QuizType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: widget.isSelect == true ? colorPrimary : colorRightIcon),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: widget.name,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: strFontName,
          ),
          SvgPicture.asset(
            icRight,
            height: 13.h,
            width: 19.w,
            fit: BoxFit.cover,
            color: widget.isSelect == true ? colorPrimary : colorRightIcon ,
          )
        ],
      ),
    );
  }
}
