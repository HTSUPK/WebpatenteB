import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import '../resources/color_resources.dart';
import '../resources/image_resources.dart';
import 'common_widgets.dart';

class QuestionItem extends StatefulWidget {
  final String? iconName, text;
  final GestureTapCallback? onTap;

  const QuestionItem({
    super.key,
    this.iconName,
    this.text,
    this.onTap,
  });

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Row(
        children: [
          Image.asset(
            widget.iconName!,
            height: 16.h,
            width: 18.w,
            fit: BoxFit.fill,
          ),
          widthBox(5.w),
          TextWidget(
            text: widget.text,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: colorBlack.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
