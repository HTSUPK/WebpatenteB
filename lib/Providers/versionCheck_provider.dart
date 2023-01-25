import 'package:flutter/foundation.dart';
import 'package:webpatente/utils/app_utils.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/version_check_Model.dart';

class VersionCheckProvider extends ChangeNotifier {
  /// App Version Check ///

  Future<BaseModel<VersionCheckModel>> callApiVersionCheck(body, context) async {
    VersionCheckModel response;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).versionCheckRequest(body);
      if (response.status == 200) {
        notifyListeners();
      } else if (response.status == 412) {
        AppUtils.toast(response.message);
          // showDialog<String>(
          //   context: context,
          //   builder: (BuildContext context) => AlertDialog(
          //     backgroundColor: colorPrimary,
          //     content: TextWidget(
          //       text: response.message,
          //       color: colorWhite,
          //       textAlign: TextAlign.center,
          //       fontWeight: FontWeight.w500,
          //     ),
          //     actions: <Widget>[
          //       TextButton(
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //         },
          //         child: TextWidget(
          //           text: "Cancel",
          //           color: colorWhite,
          //           textAlign: TextAlign.center,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       TextButton(
          //         onPressed: () async {
          //           Navigator.of(context).pop();
          //         },
          //         child: TextWidget(
          //           text: "Update",
          //           color: colorWhite,
          //           textAlign: TextAlign.center,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        notifyListeners();
      }
    }
    catch (error, stacktrace) {
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
