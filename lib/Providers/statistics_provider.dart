import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:webpatente/resources/color_resources.dart';

import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Statistics_Model.dart';

class StatisticsProvider extends ChangeNotifier {

  bool statisticsLoader = false;

  /// Statistics ///

  String? correct = "0";
  String? notAnswer = "0";
  String? inCorrect = "0";
  String? totalPassed = "0";
  String? totalFailed = "0";
  String? latestPassed = "0";
  String? latestFailed = "0";
  List<Graph> graphList = [];
  Color grapeColor = colorPrimary;

  Future<BaseModel<StatisticsModel>> callApiQuizResult() async {
    StatisticsModel response;
    statisticsLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).statisticsRequest();
      if (response.status == 200) {
        statisticsLoader = false;
        correct = response.data!.correct;
        notAnswer = response.data!.notAnswered;
        inCorrect = response.data!.incorrect;
        totalPassed = response.data!.pass;
        totalFailed = response.data!.fail;
        latestPassed = response.data!.latestPass;
        latestFailed = response.data!.latestFail;
        graphList.clear();
        graphList.addAll(response.data!.graph!.reversed);

        notifyListeners();
      }
    } catch (error, stacktrace) {
      statisticsLoader = false;
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
