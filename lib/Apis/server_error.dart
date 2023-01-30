import 'package:dio/dio.dart' hide Headers;
import 'package:fluttertoast/fluttertoast.dart';

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError.withError({error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";

        Fluttertoast.showToast(msg: 'Connection timeout', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";

        Fluttertoast.showToast(msg: 'Receive timeout in send request', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";

        Fluttertoast.showToast(msg: 'Receive timeout in connection', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
        break;
      case DioErrorType.response:
        _errorMessage = "Received invalid status code: ${error.response!.data}";
        try {
          if (error.response!.data['errors']['name'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['name'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['phone'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['phone'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['email'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['email'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['password'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['password'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['confirm_password'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['confirm_password'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['image'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['image'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['otp'] != null) {
            Fluttertoast.showToast(msg: '${error.response!.data['errors']['otp'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['code'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['code'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['label'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['label'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['addr1'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['addr1'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['rate'] != null) {
            Fluttertoast.showToast(
                msg: '${error.response!.data['errors']['rate'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['msg'] != null) {
            Fluttertoast.showToast(msg: '${error.response!.data['errors']['msg'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data['errors']['img'] != null) {
            Fluttertoast.showToast(msg: '${error.response!.data['errors']['img'][0]}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else if (error.response!.data != null) {
            Fluttertoast.showToast(msg: '${error.response!.data}', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          } else {
            Fluttertoast.showToast(msg: error.response!.data['message'].toString(), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            return;
          }
        } catch (error1, stacktrace) {
          Fluttertoast.showToast(msg: error.response!.data['message'], toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
          // Fluttertoast.showToast(msg: 'Exception occurred', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
          print("Exception occurred: $error stackTrace: $stacktrace apiError: ${error.response!.data}");
        }
        break;
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        Fluttertoast.showToast(msg: 'Request was cancelled', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
        break;
      case DioErrorType.other:
        _errorMessage = "Connection failed. Please check internet connection";
        Fluttertoast.showToast(
            msg: 'Connection failed. Please check internet connection', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
        break;
    }
    return _errorMessage;
  }
}
