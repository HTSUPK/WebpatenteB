import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseStatefulWidgetState<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: colorBackground,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                heightBox(27.h),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:  Image.asset(
                      icArrowLeft,
                      fit: BoxFit.cover,
                      height: 45.h,
                      width: 45.w,
                    ),
                    // SvgPicture.asset(
                    //   icArrowLeft,
                    //   alignment: Alignment.topLeft,
                    // ),
                  ),
                ),
                heightBox(6.h),
                SvgPicture.asset(
                  icForgotPassword,
                  height: 168.h,
                  width: 168.w,
                ),
                heightBox(40.h),
                TextWidget(
                  text: "Forgot Password?",
                  fontSize: 26,
                  fontFamily: strFontName,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                heightBox(15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: TextWidget(
                    text: "No Worries. Enter your registered email & We’ll send you reset instructions",
                    fontSize: 16,
                    fontFamily: strFontName,
                    color: colorBlack.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ),
                heightBox(15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      TextEditingWidget(
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        labelText: "Email",
                        fontSize: 16,
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      ),
                      heightBox(30.h),
                      CommonButton(
                        width: screenSize.width,
                        text: "Send",
                        fontSize: 19,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                heightBox(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
