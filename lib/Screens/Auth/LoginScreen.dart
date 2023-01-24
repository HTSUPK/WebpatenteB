import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Providers/auth_provider.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/text_editing_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';
import '../../resources/strings.dart';
import '../Home/HomeScreen.dart';
import 'ForgotPasswordScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState<LoginScreen> {
  bool isHideLoginPassword = true;

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBackground;

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<AuthProvider>(builder: (_, authProviderRef, __) {
      return SingleChildScrollView(
        child: Container(
          // height: screenSize.height,
          width: screenSize.width,
          color: colorBackground,
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              heightBox(50.h),
              Image.asset(
                icon,
                height: 120.h,
                width: 135.w,
                fit: BoxFit.cover,
              ),
              heightBox(48.h),
              TextWidget(
                text: "Welcome Back!",
                fontSize: 26,
                fontFamily: strFontName,
                fontWeight: FontWeight.w600,
              ),
              heightBox(8.77.h),
              TextWidget(
                text: "Sign in to continue!",
                fontSize: 16,
                color: colorBlack.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontFamily: strFontName,
              ),
              heightBox(22.h),
              TextEditingWidget(
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                labelText: "Email",
                fontSize: 16,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              heightBox(14.h),
              TextEditingWidget(
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                labelText: "Password",
                fontSize: 16,
                passwordVisible: isHideLoginPassword,
                suffixIconName: isHideLoginPassword ? icPassword : icPasswordHide,
                onTapSuffixIcon: changeLoginPassword,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              heightBox(20.h),
              CommonButton(
                width: screenSize.width,
                text: "Sign in",
                fontSize: 19,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
              heightBox(24.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: TextWidget(
                  text: "Forgot Password?",
                  fontSize: 18,
                  color: colorPrimary,
                  fontWeight: FontWeight.w500,
                  fontFamily: strFontName,
                ),
              ),
              heightBox(50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: "Don’t have an account?",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: strFontName,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: TextWidget(
                      text: "Register!",
                      fontSize: 18,
                      color: colorPrimary,
                      fontWeight: FontWeight.w600,
                      fontFamily: strFontName,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  changeLoginPassword() {
    setState(() {
      isHideLoginPassword = !isHideLoginPassword;
      setState(() {});
    });
  }
}
