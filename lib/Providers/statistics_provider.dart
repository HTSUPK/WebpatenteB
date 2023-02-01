import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:webpatente/resources/color_resources.dart';

import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Statistics_Model.dart';

class StatisticsProvider extends ChangeNotifier {
  /// Statistics ///

  String? correct = "";
  String? notAnswer = "";
  String? inCorrect = "";
  String? totalPassed = "";
  String? totalFailed = "";
  List<Graph> graphList = [];
  Color grapeColor = colorPrimary;

  Future<BaseModel<StatisticsModel>> callApiQuizResult() async {
    StatisticsModel response;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).statisticsRequest();
      if (response.status == 200) {
        correct = response.data!.correct;
        // notAnswer = response.data.;
        inCorrect = response.data!.incorrect;
        totalPassed = response.data!.pass;
        totalFailed = response.data!.fail;
        graphList.clear();
        graphList.addAll(response.data!.graph!);

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
