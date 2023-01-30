import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:webpatente/Providers/profile_provider.dart';
import 'package:webpatente/Widgets/common_appbar.dart';
import 'package:webpatente/utils/app_utils.dart';

import '../../Widgets/common_button.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends BaseStatefulWidgetState<ChangePasswordScreen> {
  bool isHideChangeOldPassword = true;
  bool isHideChangeNewPassword = true;
  bool isHideChangeConfirmPassword = true;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBackground;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return CommonAppBar(
      title: "Change Password",
      backIcon: icArrowLeft,
      backIconHeight: 45.h,
      backIconWidth: 45.w,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (_, profileProviderRef, __) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              heightBox(37.h),
              SvgPicture.asset(
                icForgotPassword,
                height: 168.h,
                width: 168.w,
              ),
              heightBox(27.h),
              TextEditingWidget(
                controller: oldPasswordController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                labelText: "Old Password",
                fontSize: 16,
                passwordVisible: isHideChangeOldPassword,
                suffixIconName: isHideChangeOldPassword ? icPassword : icPasswordHide,
                onTapSuffixIcon: changeOldPassword,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              heightBox(12.h),
              TextEditingWidget(
                controller: newPasswordController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                labelText: "New Password",
                fontSize: 16,
                passwordVisible: isHideChangeNewPassword,
                suffixIconName: isHideChangeNewPassword ? icPassword : icPasswordHide,
                onTapSuffixIcon: changeNewPassword,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              heightBox(12.h),
              TextEditingWidget(
                controller: confirmPasswordController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                labelText: "Confirm Password",
                fontSize: 16,
                passwordVisible: isHideChangeConfirmPassword,
                suffixIconName: isHideChangeConfirmPassword ? icPassword : icPasswordHide,
                onTapSuffixIcon: changeConfirmPassword,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
              ),
              heightBox(33.h),
              CommonButton(
                width: screenSize.width,
                text: "Save",
                fontSize: 19,
                onTap: () {
                  if (oldPasswordController.text.isEmpty) {
                    AppUtils.toast("Please enter old password", colorRed, colorWhite);
                  } else if (newPasswordController.text.isEmpty) {
                    AppUtils.toast("Please enter new password", colorRed, colorWhite);
                  } else if (confirmPasswordController.text.isEmpty) {
                    AppUtils.toast("Please enter confirm password", colorRed, colorWhite);
                  } else if (newPasswordController.text != confirmPasswordController.text) {
                    AppUtils.toast("Password and confirm password are not same", colorRed, colorWhite);
                  } else {
                    Map<String, dynamic> body = {
                      "old_password": oldPasswordController.text,
                      "new_password": newPasswordController.text,
                      "confirm_password": confirmPasswordController.text,
                    };
                    profileProviderRef.callApiChangePassword(body, context);
                  }
                },
              ),
              heightBox(12.h),
            ],
          ),
        ),
      );
    });
  }

  changeOldPassword() {
    setState(() {
      isHideChangeOldPassword = !isHideChangeOldPassword;
      setState(() {});
    });
  }

  changeNewPassword() {
    setState(() {
      isHideChangeNewPassword = !isHideChangeNewPassword;
      setState(() {});
    });
  }

  changeConfirmPassword() {
    setState(() {
      isHideChangeConfirmPassword = !isHideChangeConfirmPassword;
      setState(() {});
    });
  }
}
