import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/text_widget.dart';

import '../resources/color_resources.dart';

class StatisticsDetail extends StatefulWidget {
  final String? detailText, nameText;
  final Color? detailTextColor, nameTextColor;
  final double? detailFontSize, nameFontSize;

  const StatisticsDetail({
    super.key,
    this.detailText,
    this.nameText,
    this.detailTextColor,
    this.nameTextColor,
    this.detailFontSize,
    this.nameFontSize,
  });

  @override
  State<StatisticsDetail> createState() => _StatisticsDetailState();
}

class _StatisticsDetailState extends State<StatisticsDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: widget.detailText,
          fontWeight: FontWeight.w800,
          color: widget.detailTextColor ?? colorWhite,
          fontSize: widget.detailFontSize ?? 25.sp,
        ),
        TextWidget(
          text: widget.nameText,
          fontWeight: FontWeight.w500,
          color: widget.nameTextColor ?? colorWhite,
          fontSize: widget.nameFontSize ?? 14.sp,
        ),
      ],
    );
  }
}
