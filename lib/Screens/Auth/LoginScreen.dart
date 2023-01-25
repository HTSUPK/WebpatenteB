import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:webpatente/utils/app_utils.dart';
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    emailController.text = "test@gmail.com";
    passwordController.text = "123456";
    super.initState();
  }

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
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                labelText: "Email",
                fontSize: 16,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              heightBox(14.h),
              TextEditingWidget(
                controller: passwordController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                labelText: "Password",
                fontSize: 16,
                passwordVisible: isHideLoginPassword,
                suffixIconName: isHideLoginPassword ? icPassword : icPasswordHide,
                onTapSuffixIcon: changeLoginPassword,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
              ),
              heightBox(20.h),
              CommonButton(
                showLoading: authProviderRef.authLoader,
                width: screenSize.width,
                text: "Sign in",
                fontSize: 19,
                onTap: () async {
                  if (emailController.text.isEmpty) {
                    AppUtils.toast("Please enter your email");
                  } else if (passwordController.text.isEmpty) {
                    AppUtils.toast("Please enter password");
                  } else {
                    Map<String, dynamic> body = {
                      "email": emailController.text,
                      "password": passwordController.text,
                      "device_id": await AppUtils.getDeviceId(),
                      "device_type": AppUtils.getDeviceTypeID(),
                      "push_token": "",
                    };
                    // ignore: use_build_context_synchronously
                    authProviderRef.callApiLogin(body, context);
                  }
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
