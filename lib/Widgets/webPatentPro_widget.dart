import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import '../resources/color_resources.dart';

class WebPatentProWidget extends StatefulWidget {
  final String? monthText, priceText;

  const WebPatentProWidget({
    super.key,
    this.monthText,
    this.priceText,
  });

  @override
  State<WebPatentProWidget> createState() => _WebPatentProWidgetState();
}

class _WebPatentProWidgetState extends State<WebPatentProWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: colorOrange,
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            colorOrangeLight,
            colorOrange,
          ],
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: widget.monthText,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: colorWhite,
              ),
              VerticalDivider(
                color: colorBlack.withOpacity(0.2),
                thickness: 1.h,
              ),
              TextWidget(
                text: widget.priceText,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
