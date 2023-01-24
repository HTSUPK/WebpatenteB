import 'package:dio/dio.dart';


class RetroApi {
  Dio dioData() {
    final dio = Dio();
    // dio.options.headers["Accept"] = "application/json"; // Config your dio headers globally

    // dio.options.headers["VAuthorization"] = "Bearer " +  SharedPreferenceHelper.getString(ConstString.token);
    dio.options.headers["VAuthorization"] = "Bearer " "";

    dio.options.followRedirects = false;
    dio.options.connectTimeout = 75000; //5s
    dio.options.receiveTimeout = 75000;
    return dio;
  }
}
