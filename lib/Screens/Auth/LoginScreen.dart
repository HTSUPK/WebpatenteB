import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/common_widgets.dart';
import '../../Widgets/text_widget.dart';
import '../../resources/image_resources.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          heightBox(82.h),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          heightBox(48.h),
          TextWidget(
            text: "Welcome Back!",
            fontSize: 26.sp,
          )
        ],
      ),
    );
  }
}
