import 'package:flutter/foundation.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Auth_Model.dart';
import '../resources/color_resources.dart';
import '../utils/app_constants.dart';
import '../utils/app_utils.dart';
import '../utils/shared_preference_util.dart';

class SettingProvider extends ChangeNotifier {
  /// Notification ///

  bool _isNotificationSwitch = false;

  bool get isNotificationSwitch => _isNotificationSwitch;

  set isNotificationSwitch(bool value) {
    _isNotificationSwitch = value;
  }

  Future<BaseModel<AuthModel>> callApiNotificationFlag(body) async {
    AuthModel response;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).notificationFlagRequest(body);
      if (response.status == 200) {
        SharedPreferenceUtil.putString(notificationFlag, response.data!.notification);
        notifyListeners();
      } else if (response.status == 412) {
        AppUtils.toast(response.message!, colorRed, colorWhite);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  @override
  notifyListeners();
}
