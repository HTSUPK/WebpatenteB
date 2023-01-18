import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../ChangePassword/ChangePasswordScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseStatefulWidgetState<SettingScreen> {
  bool isSwitch = false;

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorWhite;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return const CommonAppBar(
      title: "Setting",
      backIcon: icArrowLeft,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          heightBox(0.h),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Notification",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
                CupertinoSwitch(
                  activeColor: colorSwitchBackground,
                  thumbColor: colorWhite,
                  trackColor: colorBlack.withOpacity(0.2),
                  value: isSwitch,
                  onChanged: (value) => setState(() => isSwitch = value),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: colorDarkBlue,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Change Password",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                  SvgPicture.asset(icArrowRight),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: colorDarkBlue,
          ),
        ],
      ),
    );
  }
}
