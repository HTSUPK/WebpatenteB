import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import 'package:webpatente/resources/color_resources.dart';

import 'common_widgets.dart';

class ChapterCard extends StatefulWidget {
  final String? image, text;
  final Color? borderColor;
  final GestureTapCallback? onTap;

  const ChapterCard({
    super.key,
    this.image,
    this.text,
    this.borderColor,
    this.onTap,
  });

  @override
  State<ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorWhite,
          border: Border.all(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.image ?? "https://hexeros.com/dev/superapp/uploads/user/user.png",
                height: 65.h,
                width: 71.w,
                fit: BoxFit.cover,
              ),
            ),
            widthBox(10.w),
            Expanded(
              child: TextWidget(
                text: widget.text,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
