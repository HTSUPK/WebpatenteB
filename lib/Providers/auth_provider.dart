import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webpatente/utils/app_utils.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Auth_Model.dart';
import '../Screens/Auth/LoginScreen.dart';
import '../Screens/Home/HomeScreen.dart';
import '../resources/color_resources.dart';
import '../utils/app_constants.dart';
import '../utils/shared_preference_util.dart';

class AuthProvider extends ChangeNotifier {
  bool authLoader = false;

  /// Check Ability ///
  Future<BaseModel<AuthModel>> callApiCheckAbility(body) async {
    AuthModel response;
    // authLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).checkAbilityRequest(body);
      if (response.status == 200) {
        // authLoader = false;
        notifyListeners();
      } else if (response.status == 412) {
        // authLoader = false;
        AppUtils.toast(response.message!, colorRed, colorWhite);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      // authLoader = false;
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  /// Register ///
  Future<BaseModel<AuthModel>> callApiRegister(body, context) async {
    AuthModel response;
    authLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).registerRequest(body);
      if (response.status == 200) {
        authLoader = false;
        SharedPreferenceUtil.putBool(isLoginKey, true);
        SharedPreferenceUtil.putString(token, response.data!.token);
        SharedPreferenceUtil.putString(userName, response.data!.name);
        SharedPreferenceUtil.putString(notificationFlag, response.data!.notification);
        SharedPreferenceUtil.putString(userEmail, response.data!.email);
        SharedPreferenceUtil.putString(userProfileImage, response.data!.profileImage);
        AppUtils.toast(response.message!, colorPrimary, colorWhite);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        notifyListeners();
      } else if (response.status == 412) {
        authLoader = false;
        AppUtils.toast(response.message!, colorRed, colorWhite);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      authLoader = false;
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      } 
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  /// Login ///
  Future<BaseModel<AuthModel>> callApiLogin(body, context) async {
    AuthModel response;
    authLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).loginRequest(body);
      if (response.status == 200) {
        authLoader = false;
        SharedPreferenceUtil.putBool(isLoginKey, true);
        SharedPreferenceUtil.putString(token, response.data!.token);
        SharedPreferenceUtil.putString(notificationFlag, response.data!.notification);
        SharedPreferenceUtil.putString(userName, response.data!.name);
        SharedPreferenceUtil.putString(userEmail, response.data!.email);
        SharedPreferenceUtil.putString(userProfileImage, response.data!.profileImage);
        AppUtils.toast(response.message!, colorPrimary, colorWhite);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        notifyListeners();
      } else if (response.status == 412) {
        authLoader = false;
        AppUtils.toast(response.message!, colorRed, colorWhite);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      authLoader = false;
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  /// Forgot Password ///
  Future<BaseModel<AuthModel>> callApiForgotPassword(body, context) async {
    AuthModel response;
    authLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).forgotPasswordRequest(body);
      if (response.status == 200) {
        authLoader = false;
        AppUtils.toast(response.message!, colorPrimary, colorWhite);
        Navigator.pop(context);
        notifyListeners();
      } else if (response.status == 412) {
        authLoader = false;
        AppUtils.toast(response.message!, colorRed, colorWhite);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      authLoader = false;
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  /// Logout ///
  Future<BaseModel<AuthModel>> callApiLogout(context) async {
    AuthModel response;
    authLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).logoutRequest();
      if (response.status == 200) {
        authLoader = false;
        AppUtils.toast(response.message!, colorPrimary, colorWhite);
        SharedPreferenceUtil.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
        notifyListeners();
      } else if (response.status == 412) {
        authLoader = false;
        AppUtils.toast(response.message!, colorRed, colorWhite);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      authLoader = false;
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
