import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:webpatente/Models/ChapterList_Model.dart';

import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';

class QuizProvider extends ChangeNotifier {
  bool quizLoader = false;

  /// Chapter List ///

  List<Data> chapterList = [];  // show chapter
  List<bool> selectChapter = []; // user select
  List selectChapterId = []; // Add to Select chapter ID

  Future<BaseModel<ChapterListModel>> callApiChapterList() async {
    ChapterListModel response;
    quizLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).chapterListRequest();
      if (response.status == 200) {
        quizLoader = false;
        chapterList.clear();
        chapterList.addAll(response.data!);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      quizLoader = false;
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
