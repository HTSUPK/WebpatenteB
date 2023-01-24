import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Auth_Model.dart';
import '../utils/app_constants.dart';
import '../utils/app_utils.dart';
import '../utils/shared_preference_util.dart';

class ProfileProvider extends ChangeNotifier {
  bool profileLoader = false;

  /// Get User Profile ///

  Future<BaseModel<AuthModel>> callApiGetUserProfile() async {
    AuthModel response;
    profileLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).getUserProfileRequest();
      if (response.status == 200) {
        profileLoader = false;
        SharedPreferenceUtil.putString(userName, response.data!.name);
        SharedPreferenceUtil.putString(userEmail, response.data!.email);
        SharedPreferenceUtil.putString(userPhoneCode, response.data!.countryCode);
        SharedPreferenceUtil.putString(userPhoneNo, response.data!.mobile);
        SharedPreferenceUtil.putString(userProfileImage, response.data!.profileImage);
        // Navigator.pop(context);
        notifyListeners();
      } else if (response.status == 412) {
        profileLoader = false;
        AppUtils.toast(response.message!);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      profileLoader = false;
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
