import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import '../../Providers/versionCheck_provider.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import '../../utils/app_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  late VersionCheckProvider versionCheckProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    versionCheckProviderRef = Provider.of(context, listen: false);
  }

  @override
  // TODO: implement shouldHaveSafeArea
  bool get shouldHaveSafeArea => false;

  @override
  Widget buildBody(BuildContext context) {
    Future.delayed(const Duration(seconds: 0), () {
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
        Map<String, dynamic> body = {
          "type": AppUtils.getDeviceTypeID(),
          "version": packageInfo.version,
          "device_id": await AppUtils.getDeviceId(),
          // "device_id": "123456",
        };
        versionCheckProviderRef.callApiVersionCheck(body, context);
      });
    });
    return Image.asset(
      splash,
      fit: BoxFit.cover,
    );
  }
}
