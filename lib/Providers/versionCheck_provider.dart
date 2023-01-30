import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webpatente/utils/app_utils.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/version_check_Model.dart';
import '../Screens/Profile/EditProfileScreen.dart';
import '../Widgets/text_widget.dart';
import '../resources/color_resources.dart';

class VersionCheckProvider extends ChangeNotifier {
  /// App Version Check ///

  Future<BaseModel<VersionCheckModel>?> callApiVersionCheck(body, contexts) async {
    VersionCheckModel responses;
    notifyListeners();
    try {
      responses = await RestClient(RetroApi().dioData()).versionCheckRequest(body);
      if (responses.status == 200) {
        notifyListeners();
      }
    } on DioError catch (error, stacktrace) {
      if (error.response != null) {
        if (error.response!.statusCode == 412) {
          await showDialog<void>(
            context: contexts,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: colorPrimary,
              title: TextWidget(
                text: "Log Out",
                fontSize: 18,
                color: colorWhite,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              content: TextWidget(
                text: error.response!.data['status'],
                color: colorWhite,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(contexts).pop();
                  },
                  child: TextWidget(
                    text: "Cancel",
                    color: colorWhite,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(contexts).pop();
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
      } else {
        // AppUtils.toast(error.message);
      }
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = responses;
  }

  @override
  notifyListeners();
}
