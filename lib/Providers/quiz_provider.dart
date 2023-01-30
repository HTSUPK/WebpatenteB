import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:webpatente/Models/ChapterList_Model.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/FullQuiz_Model.dart';
import '../Models/SelectedQuiz_Model.dart';

class QuizProvider extends ChangeNotifier {
  bool quizLoader = false;

  /// Chapter List ///

  List<Data> chapterList = []; // show chapter
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

  /// Quiz Function ///

  // double _progress = 0;
  // double get progress => _progress;
  //
  // set progress(double value) {
  //   _progress = value;
  // }
  // String minuteString = "00", secondString = "00";
  // int minutes = 0, seconds = 0, isSelect = 0;
  // late Timer timer;
  //
  int _giveMinute = 0;

  int get giveMinute => _giveMinute;

  set giveMinute(int value) {
    _giveMinute = value;
  } //
  // void _startSecond() {
  //   if (seconds < 59) {
  //     seconds++;
  //     secondString = seconds.toString();
  //     if (secondString.length == 1) {
  //       secondString = "0$secondString";
  //     }
  //   } else {
  //     _startMinute();
  //   }
  //   notifyListeners();
  // }
  //
  // void _startMinute() {
  //   if (minutes < 59) {
  //     seconds = 0;
  //     secondString = "00";
  //     minutes++;
  //     minuteString = minutes.toString();
  //     if (minuteString.length == 1) {
  //       minuteString = "0$minuteString";
  //     }
  //   }
  //   notifyListeners();
  // }
  //
  // totalProgressTime() {
  //   int currentSecond = int.parse(secondString) + (int.parse(minuteString) * 60);
  //   progress = currentSecond / (giveMinute * 60);
  //   notifyListeners();
  // }

  /// full Quiz ///

  List<FullQuizData> fullQuizList = [];

  Future<BaseModel<FullQuizModel>> callApiFullQuiz(body) async {
    FullQuizModel response;
    quizLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).fullQuizRequest(body);
      if (response.status == 200) {
        quizLoader = false;
        giveMinute = int.parse(response.fullQuizTimer!);
        selectedQuizList.clear();
        fullQuizList.clear();
        fullQuizList.addAll(response.data!);
        // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        //   _startSecond();
        //   totalProgressTime();
        // });
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

  /// Selected Quiz ///

  List<SelectedQuizData> selectedQuizList = [];

  Future<BaseModel<SelectedQuizModel>> callApiSelectedQuiz(body) async {
    SelectedQuizModel response;
    quizLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).selectQuizRequest(body);
      if (response.status == 200) {
        quizLoader = false;
        fullQuizList.clear();
        selectedQuizList.clear();
        selectedQuizList.addAll(response.data!);
        giveMinute = response.selectedQuizeTimer!.toInt();
        // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        //   _startSecond();
        //   totalProgressTime();
        // });
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
