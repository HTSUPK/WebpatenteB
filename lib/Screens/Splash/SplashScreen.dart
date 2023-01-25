import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:webpatente/Screens/Home/HomeScreen.dart';
import '../../Providers/versionCheck_provider.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_utils.dart';
import '../../utils/shared_preference_util.dart';
import '../Auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  late VersionCheckProvider versionCheckProviderRef;

  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //     // ignore: use_build_context_synchronously
  //     versionCheckProviderRef = Provider.of(context, listen: false);
  //     Future.delayed(const Duration(seconds: 0), () {
  //       Map<String, dynamic> body = {
  //         "type": "android",
  //         "version": packageInfo.version,
  //         "push_token": "",
  //         "device_id": "123456",
  //         "device_type": "android",
  //       };
  //     });
  String appVersion = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    versionCheckProviderRef = Provider.of(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
        appVersion = packageInfo.version;
        Map<String, dynamic> body = {
          "type": AppUtils.getDeviceTypeID(),
          "version": packageInfo.version,
          // "version": 0,
          "device_id": await AppUtils.getDeviceId(),
          "device_type": AppUtils.getDeviceTypeID(),
        };
        versionCheckProviderRef.callApiVersionCheck(body, context);
      });
    });
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
