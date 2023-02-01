import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webpatente/Models/ChapterList_Model.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/QuizResult_Model.dart';
import '../Models/Quiz_Model.dart';
import '../Screens/Quiz/ResultScreen.dart';

class QuizProvider extends ChangeNotifier {
  bool quizLoader = false;

  /// Chapter List ///

  List<ChapterList> chapterList = []; // show chapter
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
        chapterList.addAll(response.data!.chapter!);
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

  int _giveMinute = 0;

  int get giveMinute => _giveMinute;

  set giveMinute(int value) {
    _giveMinute = value;
  }

  List<Result> isSelectAnswerList = [];

  onSelect(String? ans, int? index) {
    var target = isSelectAnswerList.firstWhere((item) => item.id == index);
    target.yourAnswer = ans;
    target.isAnswered = 1;
  }

  /// Timer Function ///
  String minuteString = "00", secondString = "00";
  int minutes = 0, seconds = 0, isSelect = 0;
  late Timer timer;
  double progress = 0;

  void startSecond() {
    if (seconds < 59) {
      seconds++;
      secondString = seconds.toString();
      if (secondString.length == 1) {
        secondString = "0$secondString";
        notifyListeners();
      }
    } else {
      startMinute();
    }
  }

  void startMinute() {
    if (minutes < 59) {
      seconds = 0;
      secondString = "00";
      minutes++;
      minuteString = minutes.toString();
      if (minuteString.length == 1) {
        minuteString = "0$minuteString";
        notifyListeners();
      }
    }
  }

  totalProgressTime(context) {
    int currentSecond = int.parse(secondString) + (int.parse(minuteString) * 60);
    progress = currentSecond / (giveMinute * 60);
    // progress = currentSecond / (0.5 * 60);
    if (progress == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            result: isSelectAnswerList,
            time: "$minuteString:$secondString",
          ),
        ),
      );
    }
    notifyListeners();
  }

  /// full Quiz Api///

  List<QuizData> _quizList = [];

  List<QuizData> get quizList => _quizList;

  set quizList(List<QuizData> value) {
    _quizList = value;
  }

  Future<BaseModel<QuizModel>> callApiFullQuiz(body) async {
    QuizModel response;
    quizLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).fullQuizRequest(body);
      if (response.status == 200) {
        quizLoader = false;
        // giveMinute = int.parse(response.timer!);
        giveMinute = response.timer!;
        quizList.clear();
        quizList.addAll(response.data!);
        isSelectAnswerList.clear();
        for (int i = 0; i < response.data!.length; i++) {
          isSelectAnswerList.add(Result(
            id: i,
            image: response.data![i].image,
            question: response.data![i].question,
            correct: response.data![i].answer,
            yourAnswer: "",
            isAnswered: 0,
          ));
        }
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

  /// Selected Quiz Api ///

  Future<BaseModel<QuizModel>> callApiSelectedQuiz(body) async {
    QuizModel response;
    quizLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).selectQuizRequest(body);
      if (response.status == 200) {
        quizLoader = false;
        // giveMinute = int.parse(response.timer!);
        giveMinute = response.timer!;
        quizList.clear();
        quizList.addAll(response.data!);
        isSelectAnswerList.clear();
        for (int i = 0; i < response.data!.length; i++) {
          isSelectAnswerList.add(Result(
            id: i,
            image: response.data![i].image,
            question: response.data![i].question,
            correct: response.data![i].answer,
            yourAnswer: "",
            isAnswered: 0,
          ));
        }
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

  /// Quiz Result ///

  int correct = 0;
  int notAnswered = 0;
  int incorrect = 0;
  String? quizType = "";
  List<Map<String, dynamic>> selectAnswerList = [];
  String selectAnswerConvert = "";

  isCalculate() {
    correct = 0;
    notAnswered = 0;
    incorrect = 0;
    for (int i = 0; i < isSelectAnswerList.length; i++) {
      if (isSelectAnswerList[i].yourAnswer != "") {
        if (isSelectAnswerList[i].yourAnswer == isSelectAnswerList[i].correct) {
          correct++;
        } else {
          incorrect++;
        }
      } else {
        notAnswered++;
      }
    }

    /// Result Api ///

    selectAnswerList.clear();
    for (int j = 0; j < isSelectAnswerList.length; j++) {
      Map<String, dynamic> answerMap = {
        "name": isSelectAnswerList[j].question,
        "your_answer": isSelectAnswerList[j].yourAnswer,
        "correct": isSelectAnswerList[j].correct,
      };
      selectAnswerList.add(answerMap);
      selectAnswerConvert = json.encode(selectAnswerList);
    }
    print("AnswerMap $selectAnswerList");
    print("ConvertAnswerMap $selectAnswerConvert");
    Map<String, dynamic> body = {
      "time": (int.parse(minuteString) + 1).toString(),
      "payload": selectAnswerConvert,
      "type": quizType,
      "correct_answer": correct.toString(),
      "not_answer": notAnswered.toString(),
      "incorrect": incorrect.toString(),
    };
    Future.delayed(const Duration(seconds: 0), () {
      callApiQuizResult(body);
    });
  }

  Future<BaseModel<QuizResultModel>> callApiQuizResult(body) async {
    QuizResultModel response;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).quizResultRequest(body);
      if (response.status == 200) {
        print("${response.data!}");
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

/// Quiz Model ///
class Result {
  int? id;
  String? image;
  String? question;
  String? correct;
  String? yourAnswer;
  int? isAnswered;

  Result({this.id, this.image, this.question, this.correct, this.yourAnswer, this.isAnswered});
}
