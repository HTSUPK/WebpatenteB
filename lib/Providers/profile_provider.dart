import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  /// Edit User Profile ///

  Future<BaseModel<AuthModel>> callApiEditUserProfile(body) async {
    AuthModel response;
    profileLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApiProfile().dioData()).editUserProfileRequest(body);
      if (response.status == 200) {
        profileLoader = false;
        AppUtils.toast(response.message!);
        SharedPreferenceUtil.putString(userName, response.data!.name);
        SharedPreferenceUtil.putString(userProfileImage, response.data!.profileImage);
        SharedPreferenceUtil.putString(userEmail, response.data!.email);
        SharedPreferenceUtil.putString(userPhoneCode, response.data!.countryCode);
        SharedPreferenceUtil.putString(userPhoneNo, response.data!.mobile);
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

  /* Future<String?> callApiEditUserProfile(userName) async {
    Dio dio = Dio();
    dio.options.headers["Accept"] = "application/json"; // config your dio headers globally
    dio.options.headers["Content-Type"] = "multipart/form-data"; // config your dio headers globally
    dio.options.headers["VAuthorization"] = "Bearer ${SharedPreferenceUtil.getString(token)}";
    dio.options.followRedirects = false;
    dio.options.connectTimeout = 75000; //5s
    dio.options.receiveTimeout = 3000;
    String fileName = filePath!.split('/').last;

    FormData formData;
    formData = FormData.fromMap({
      "profile_image": MultipartFile.fromFileSync(filePath!, filename: fileName),
      "name": userName,
      "mobile": "9876543210",
      "email": "test@gmail.com",
    });
    profileLoader = true;
    notifyListeners();
    try {
      // var response = await dio.post("${Apis.baseUrl}  ${Apis.editUserProfile}", data: formData);
      var response = await dio.post("https://hexeros.com/dev/web-patente/api/V1/user/edit_profile", data: formData);
      if (response.statusCode == 200) {
        profileLoader = false;
        AppUtils.toast("Success");
        notifyListeners();
      }
    } catch (e) {
      profileLoader = false;
      if (kDebugMode) {
        print(e.toString());
      }
      notifyListeners();
    }
    notifyListeners();
    return "";
  }*/

  /// Profile Image ///

  final ImagePicker picker = ImagePicker();
  File? proImage;
  String? filePath = "";

  /// Change password ///

  Future<BaseModel<AuthModel>> callApiChangePassword(body, context) async {
    AuthModel response;
    profileLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).changePasswordRequest(body);
      if (response.status == 200) {
        profileLoader = false;
        AppUtils.toast(response.message!);
        Navigator.pop(context);
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
