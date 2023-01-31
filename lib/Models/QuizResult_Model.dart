import 'dart:convert';
/// status : 200
/// message : "success"
/// data : {"user_id":20,"time":"120","payload":"[{\"question\":\"John\", \"your_answer\":true, \"correct\":\"true\"}]","correct_answer":"70","not_answer":"3","incorrect":"7","updated_at":"2023-01-31T12:41:40.000000Z","created_at":"2023-01-31T12:41:40.000000Z","id":8}

QuizResultModel quizResultModelFromJson(String str) => QuizResultModel.fromJson(json.decode(str));
String quizResultModelToJson(QuizResultModel data) => json.encode(data.toJson());
class QuizResultModel {
  QuizResultModel({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  QuizResultModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
QuizResultModel copyWith({  num? status,
  String? message,
  Data? data,
}) => QuizResultModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : 20
/// time : "120"
/// payload : "[{\"question\":\"John\", \"your_answer\":true, \"correct\":\"true\"}]"
/// correct_answer : "70"
/// not_answer : "3"
/// incorrect : "7"
/// updated_at : "2023-01-31T12:41:40.000000Z"
/// created_at : "2023-01-31T12:41:40.000000Z"
/// id : 8

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? userId, 
      String? time, 
      String? payload, 
      String? correctAnswer, 
      String? notAnswer, 
      String? incorrect, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _userId = userId;
    _time = time;
    _payload = payload;
    _correctAnswer = correctAnswer;
    _notAnswer = notAnswer;
    _incorrect = incorrect;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _time = json['time'];
    _payload = json['payload'];
    _correctAnswer = json['correct_answer'];
    _notAnswer = json['not_answer'];
    _incorrect = json['incorrect'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  num? _userId;
  String? _time;
  String? _payload;
  String? _correctAnswer;
  String? _notAnswer;
  String? _incorrect;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
Data copyWith({  num? userId,
  String? time,
  String? payload,
  String? correctAnswer,
  String? notAnswer,
  String? incorrect,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => Data(  userId: userId ?? _userId,
  time: time ?? _time,
  payload: payload ?? _payload,
  correctAnswer: correctAnswer ?? _correctAnswer,
  notAnswer: notAnswer ?? _notAnswer,
  incorrect: incorrect ?? _incorrect,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  num? get userId => _userId;
  String? get time => _time;
  String? get payload => _payload;
  String? get correctAnswer => _correctAnswer;
  String? get notAnswer => _notAnswer;
  String? get incorrect => _incorrect;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['time'] = _time;
    map['payload'] = _payload;
    map['correct_answer'] = _correctAnswer;
    map['not_answer'] = _notAnswer;
    map['incorrect'] = _incorrect;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}