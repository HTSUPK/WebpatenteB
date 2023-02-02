import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/version_check_Model.dart';
import '../Screens/Auth/LoginScreen.dart';
import '../Screens/Home/HomeScreen.dart';
import '../Widgets/text_widget.dart';
import '../resources/color_resources.dart';
import '../utils/app_constants.dart';
import '../utils/shared_preference_util.dart';

class VersionCheckProvider extends ChangeNotifier {
  /// App Version Check ///

  Future<BaseModel<VersionCheckModel>?> callApiVersionCheck(body, contexts) async {
    VersionCheckModel responses;
    notifyListeners();
    try {
      responses = await RestClient(RetroApi().dioData()).versionCheckRequest(body);
      if (responses.status == 200) {
        Timer(
          const Duration(seconds: 3),
              () =>
          SharedPreferenceUtil.getBool(isLoginKey) == true
              ? Navigator.pushReplacement(
            contexts,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          )
              : Navigator.pushReplacement(
            contexts,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ),
        );
        notifyListeners();
      }
    } on DioError catch (error, stacktrace) {
      if (error.response != null) {
        if (error.response!.statusCode == 412) {
          // print("Data ${error.response!.data['data']}");
          await showDialog<void>(
            context: contexts,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                AlertDialog(
                  backgroundColor: colorPrimary,
                  title: TextWidget(
                    text: "Update",
                    fontSize: 18,
                    color: colorWhite,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                  content: TextWidget(
                    text: error.response!.data['message'].toString(),
                    color: colorWhite,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  actions: <Widget>[
                    error.response!.data['data']['is_force_update'] == "0" ?
                    TextButton(
                      onPressed: () {
                        Navigator.of(contexts).pop();
                        Timer(
                          const Duration(seconds: 3),
                              () =>
                          SharedPreferenceUtil.getBool(isLoginKey) == true
                              ? Navigator.pushReplacement(
                            contexts,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          )
                              : Navigator.pushReplacement(
                            contexts,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                        );
                        notifyListeners();
                      },
                      child: TextWidget(
                        text: "Cancel",
                        color: colorWhite,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ) : const SizedBox(),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        // authProviderRef.callApiLogout(this.context);
                      },
                      child: TextWidget(
                        text: "Update",
                        color: colorWhite,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
          );
          // return error.response!.data;
        }
      } else {}
      return BaseModel()
        ..setException(ServerError.withError(error: error));
    }
    return BaseModel()
      ..data = responses;
  }

  @override
  notifyListeners();
}
