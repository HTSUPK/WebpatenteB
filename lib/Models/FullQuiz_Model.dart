import 'dart:convert';
/// status : 200
/// message : "success"
/// data : [{"id":1,"chapter_id":2,"question":"we","answer":"true","audio":"uploads/quiz/audio/Y6j8ilJ2eANvgsJgMaYgapSQ75TmmYc6bOECHmyT.mp3"}]
/// FullQuiz Timer : "20"

FullQuizModel fullQuizModelFromJson(String str) => FullQuizModel.fromJson(json.decode(str));
String fullQuizModelToJson(FullQuizModel data) => json.encode(data.toJson());
class FullQuizModel {
  FullQuizModel({
      num? status, 
      String? message, 
      List<FullQuizData>? data,
      String? fullQuizTimer,}){
    _status = status;
    _message = message;
    _data = data;
    _fullQuizTimer = fullQuizTimer;
}

  FullQuizModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(FullQuizData.fromJson(v));
      });
    }
    _fullQuizTimer = json['FullQuiz Timer'];
  }
  num? _status;
  String? _message;
  List<FullQuizData>? _data;
  String? _fullQuizTimer;
FullQuizModel copyWith({  num? status,
  String? message,
  List<FullQuizData>? data,
  String? fullQuizTimer,
}) => FullQuizModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  fullQuizTimer: fullQuizTimer ?? _fullQuizTimer,
);
  num? get status => _status;
  String? get message => _message;
  List<FullQuizData>? get data => _data;
  String? get fullQuizTimer => _fullQuizTimer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['FullQuiz Timer'] = _fullQuizTimer;
    return map;
  }

}

/// id : 1
/// chapter_id : 2
/// question : "we"
/// answer : "true"
/// audio : "uploads/quiz/audio/Y6j8ilJ2eANvgsJgMaYgapSQ75TmmYc6bOECHmyT.mp3"

FullQuizData dataFromJson(String str) => FullQuizData.fromJson(json.decode(str));
String dataToJson(FullQuizData data) => json.encode(data.toJson());
class FullQuizData {
  FullQuizData({
      num? id, 
      num? chapterId, 
      String? question, 
      String? answer, 
      String? audio,}){
    _id = id;
    _chapterId = chapterId;
    _question = question;
    _answer = answer;
    _audio = audio;
}

  FullQuizData.fromJson(dynamic json) {
    _id = json['id'];
    _chapterId = json['chapter_id'];
    _question = json['question'];
    _answer = json['answer'];
    _audio = json['audio'];
  }
  num? _id;
  num? _chapterId;
  String? _question;
  String? _answer;
  String? _audio;
FullQuizData copyWith({  num? id,
  num? chapterId,
  String? question,
  String? answer,
  String? audio,
}) => FullQuizData(  id: id ?? _id,
  chapterId: chapterId ?? _chapterId,
  question: question ?? _question,
  answer: answer ?? _answer,
  audio: audio ?? _audio,
);
  num? get id => _id;
  num? get chapterId => _chapterId;
  String? get question => _question;
  String? get answer => _answer;
  String? get audio => _audio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['chapter_id'] = _chapterId;
    map['question'] = _question;
    map['answer'] = _answer;
    map['audio'] = _audio;
    return map;
  }

}