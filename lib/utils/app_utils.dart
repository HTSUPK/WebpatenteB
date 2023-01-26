import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../resources/color_resources.dart';
import '../resources/strings.dart';
import '../widgets/text_widget.dart';
import 'app_constants.dart';
import 'page_transition_utils.dart';

class AppUtils {
  AppUtils._privateConstructor();

  static final AppUtils instance = AppUtils._privateConstructor();

  void push({
    required Widget enterPage,
    bool shouldUseRootNavigator = false,
    Function? callback,
  }) {
    ScaffoldMessenger.of(rootNavigatorKey.currentContext!).hideCurrentSnackBar();
    FocusScope.of(rootNavigatorKey.currentContext!).requestFocus(FocusNode());
    Navigator.of(rootNavigatorKey.currentContext!, rootNavigator: shouldUseRootNavigator)
        .push(
      SlideLeftRoute(page: enterPage),
    )
        .then((value) {
      callback?.call(value);
    });
  }

  void pushAndClearStack({
    required Widget enterPage,
    bool shouldUseRootNavigator = false,
  }) {
    ScaffoldMessenger.of(rootNavigatorKey.currentContext!).hideCurrentSnackBar();
    Navigator.of(rootNavigatorKey.currentContext!, rootNavigator: shouldUseRootNavigator)
        .pushAndRemoveUntil(SlideLeftRoute(page: enterPage), (Route<dynamic> route) => false);
  }

  showMessageBlackBG({String? message}) {
    ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: colorPrimary,
        duration: const Duration(seconds: 2),
        content: TextWidget(
          text: message,
          fontSize: 14.sp,
          color: colorWhite,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void showMessage(String message, ScaffoldState state) {
    final snackBar = SnackBar(
      content: TextWidget(
        text: message,
        color: colorWhite,
      ),
      backgroundColor: colorPrimary,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    );
    // state.hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
    // state.showSnackBar(snackBar);
  }

  String convertStringToDateFormat(String stringDate) {
    String subscriptionExpireDate = "";
    subscriptionExpireDate = stringDate;

    DateTime startDateTime = DateTime.tryParse(subscriptionExpireDate) ?? DateTime.now();

    subscriptionExpireDate = '${startDateTime.day}/${startDateTime.month}/${startDateTime.year} ';

    return subscriptionExpireDate;
  }

  //Date Format : yyyy-MM-dd
  String convertDateToDDMMYYYYFormat({String? dateString}) {
    DateTime dt = DateTime.parse(dateString!).toLocal();
    String date = DateFormat("yyyy-MM-dd hh:mm a").format(dt).toString();
    return date;
  }

  //Date Format : March 25,2020 - 10:30 PM
  String convertDateToMMMDDYYYYFormat({String? dateString}) {
    DateTime dt = DateTime.parse(dateString!).toLocal();
    String date = DateFormat("MMM dd,yyyy hh:mm a").format(dt).toString();
    return date;
  }

  String convertDateToTimeFormat({String? dateString}) {
    DateTime dt = DateTime.parse(dateString!).toLocal();
    String date = DateFormat("hh:mm a").format(dt).toString();
    return date;
  }

  ///  Find Device ID ///
  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  /// Find Device Type ///
  static String getDeviceTypeID() {
    return Platform.isAndroid ? androidDeviceTypeId : iosDeviceTypeId;
  }

  /// Toast ///
  static toast(String? msg) {
    return Fluttertoast.showToast(
      msg: msg!,
      backgroundColor: colorPrimary,
      textColor: colorWhite,
    );
  }


  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
