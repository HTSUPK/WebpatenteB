import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Auth_Model.dart';

class AuthProvider extends ChangeNotifier {
  /// Register ///

  Future<BaseModel<AuthModel>> callApiRegister(body, context) async {
    AuthModel response;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).registerRequest(body);
      if (response.status == 200) {
        Fluttertoast.showToast(msg: response.message!);
        notifyListeners();
      } else if (response.status == 412) {
        Fluttertoast.showToast(msg: response.message!);
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
