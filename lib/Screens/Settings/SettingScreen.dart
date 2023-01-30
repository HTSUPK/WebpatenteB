import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Providers/setting_provider.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_preference_util.dart';
import '../ChangePassword/ChangePasswordScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseStatefulWidgetState<SettingScreen> {
  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBackground;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return CommonAppBar(
      title: "Setting",
      backIcon: icArrowLeft,
      backIconHeight: 45.h,
      backIconWidth: 45.w,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<SettingProvider>(context, listen: false).isNotificationSwitch =
        SharedPreferenceUtil.getString(notificationFlag) == "1" ? true : false;
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<SettingProvider>(builder: (_, settingProviderRef, __) {
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
                      value: settingProviderRef.isNotificationSwitch,
                      onChanged: (value) {
                          settingProviderRef.isNotificationSwitch = value;
                          Map<String, dynamic> body = {
                            "notification": value == true ? "1" : "0",
                          };
                          settingProviderRef.callApiNotificationFlag(body);
                        // setState(() {
                        //   setState(() {});
                        // });
                      }),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: colorDarkBlue,
            ),
            InkWell(
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
    });
  }
}
