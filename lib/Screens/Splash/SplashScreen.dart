import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Screens/Home/HomeScreen.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_preference_util.dart';
import '../Auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => SharedPreferenceUtil.getBool(isLoginKey) == true
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      height: 690.h,
      width: 360.w,
      child: Image.asset(
        splash,
        fit: BoxFit.cover,
      ),
    );
  }
}
