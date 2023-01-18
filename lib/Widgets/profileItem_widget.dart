import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/Widgets/text_widget.dart';
import '../resources/color_resources.dart';
import '../resources/image_resources.dart';
import 'common_widgets.dart';

class ProfileItem extends StatefulWidget {
  final String? textName, iconName;
  final GestureTapCallback? onTap;

  const ProfileItem({
    super.key,
    this.textName,
    this.iconName,
    this.onTap,
  });

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: colorDarkBlue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.iconName!,
                ),
                widthBox(15.w),
                TextWidget(
                  text: widget.textName!,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                SvgPicture.asset(
                  icArrowRight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
