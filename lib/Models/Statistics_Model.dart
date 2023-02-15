import 'dart:convert';
/// status : 200
/// message : "success"
/// data : {"correct":"364.00","not_answered":"22.00","incorrect":"42.00","pass":"85.05","fail":"14.95","latest_pass":"85.05","latest_fail":"14.95","graph":[{"id":7,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-01-31T12:41:24.000000Z","result":"pass","percentage":"87.50"},{"id":8,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-01-31T12:41:40.000000Z","result":"pass","percentage":"87.50"},{"id":9,"user_id":20,"type":"full","correct_answer":"1","not_answer":"0","incorrect":"4","created_at":"2023-01-31T12:50:08.000000Z","result":"fail","percentage":"20.00"},{"id":10,"user_id":20,"type":"full","correct_answer":"4","not_answer":"0","incorrect":"1","created_at":"2023-01-31T12:56:46.000000Z","result":"pass","percentage":"80.00"},{"id":13,"user_id":20,"type":"full","correct_answer":"3","not_answer":"1","incorrect":"1","created_at":"2023-02-01T06:28:36.000000Z","result":"fail","percentage":"60.00"},{"id":21,"user_id":20,"type":"full","correct_answer":"3","not_answer":"0","incorrect":"0","created_at":"2023-02-04T10:48:45.000000Z","result":"pass","percentage":"100.00"},{"id":22,"user_id":20,"type":"full","correct_answer":"2","not_answer":"1","incorrect":"1","created_at":"2023-02-04T10:49:01.000000Z","result":"fail","percentage":"50.00"},{"id":31,"user_id":20,"type":"full","correct_answer":"0","not_answer":"2","incorrect":"0","created_at":"2023-02-07T11:02:37.000000Z","result":"fail","percentage":"0.00"},{"id":32,"user_id":20,"type":"full","correct_answer":"0","not_answer":"2","incorrect":"0","created_at":"2023-02-07T11:03:26.000000Z","result":"fail","percentage":"0.00"},{"id":33,"user_id":20,"type":"full","correct_answer":"1","not_answer":"1","incorrect":"0","created_at":"2023-02-07T13:09:58.000000Z","result":"fail","percentage":"50.00"},{"id":38,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-02-15T11:22:53.000000Z","result":"pass","percentage":"87.50"},{"id":40,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-02-15T12:01:02.000000Z","result":"pass","percentage":"87.50"},{"id":41,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-02-15T12:07:07.000000Z","result":"pass","percentage":"87.50"}]}

StatisticsModel statisticsModelFromJson(String str) => StatisticsModel.fromJson(json.decode(str));
String statisticsModelToJson(StatisticsModel data) => json.encode(data.toJson());
class StatisticsModel {
  StatisticsModel({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  StatisticsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
StatisticsModel copyWith({  num? status,
  String? message,
  Data? data,
}) => StatisticsModel(  status: status ?? _status,
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

/// correct : "364.00"
/// not_answered : "22.00"
/// incorrect : "42.00"
/// pass : "85.05"
/// fail : "14.95"
/// latest_pass : "85.05"
/// latest_fail : "14.95"
/// graph : [{"id":7,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-01-31T12:41:24.000000Z","result":"pass","percentage":"87.50"},{"id":8,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-01-31T12:41:40.000000Z","result":"pass","percentage":"87.50"},{"id":9,"user_id":20,"type":"full","correct_answer":"1","not_answer":"0","incorrect":"4","created_at":"2023-01-31T12:50:08.000000Z","result":"fail","percentage":"20.00"},{"id":10,"user_id":20,"type":"full","correct_answer":"4","not_answer":"0","incorrect":"1","created_at":"2023-01-31T12:56:46.000000Z","result":"pass","percentage":"80.00"},{"id":13,"user_id":20,"type":"full","correct_answer":"3","not_answer":"1","incorrect":"1","created_at":"2023-02-01T06:28:36.000000Z","result":"fail","percentage":"60.00"},{"id":21,"user_id":20,"type":"full","correct_answer":"3","not_answer":"0","incorrect":"0","created_at":"2023-02-04T10:48:45.000000Z","result":"pass","percentage":"100.00"},{"id":22,"user_id":20,"type":"full","correct_answer":"2","not_answer":"1","incorrect":"1","created_at":"2023-02-04T10:49:01.000000Z","result":"fail","percentage":"50.00"},{"id":31,"user_id":20,"type":"full","correct_answer":"0","not_answer":"2","incorrect":"0","created_at":"2023-02-07T11:02:37.000000Z","result":"fail","percentage":"0.00"},{"id":32,"user_id":20,"type":"full","correct_answer":"0","not_answer":"2","incorrect":"0","created_at":"2023-02-07T11:03:26.000000Z","result":"fail","percentage":"0.00"},{"id":33,"user_id":20,"type":"full","correct_answer":"1","not_answer":"1","incorrect":"0","created_at":"2023-02-07T13:09:58.000000Z","result":"fail","percentage":"50.00"},{"id":38,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-02-15T11:22:53.000000Z","result":"pass","percentage":"87.50"},{"id":40,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-02-15T12:01:02.000000Z","result":"pass","percentage":"87.50"},{"id":41,"user_id":20,"type":"full","correct_answer":"70","not_answer":"3","incorrect":"7","created_at":"2023-02-15T12:07:07.000000Z","result":"pass","percentage":"87.50"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? correct, 
      String? notAnswered, 
      String? incorrect, 
      String? pass, 
      String? fail, 
      String? latestPass, 
      String? latestFail, 
      List<Graph>? graph,}){
    _correct = correct;
    _notAnswered = notAnswered;
    _incorrect = incorrect;
    _pass = pass;
    _fail = fail;
    _latestPass = latestPass;
    _latestFail = latestFail;
    _graph = graph;
}

  Data.fromJson(dynamic json) {
    _correct = json['correct'];
    _notAnswered = json['not_answered'];
    _incorrect = json['incorrect'];
    _pass = json['pass'];
    _fail = json['fail'];
    _latestPass = json['latest_pass'];
    _latestFail = json['latest_fail'];
    if (json['graph'] != null) {
      _graph = [];
      json['graph'].forEach((v) {
        _graph?.add(Graph.fromJson(v));
      });
    }
  }
  String? _correct;
  String? _notAnswered;
  String? _incorrect;
  String? _pass;
  String? _fail;
  String? _latestPass;
  String? _latestFail;
  List<Graph>? _graph;
Data copyWith({  String? correct,
  String? notAnswered,
  String? incorrect,
  String? pass,
  String? fail,
  String? latestPass,
  String? latestFail,
  List<Graph>? graph,
}) => Data(  correct: correct ?? _correct,
  notAnswered: notAnswered ?? _notAnswered,
  incorrect: incorrect ?? _incorrect,
  pass: pass ?? _pass,
  fail: fail ?? _fail,
  latestPass: latestPass ?? _latestPass,
  latestFail: latestFail ?? _latestFail,
  graph: graph ?? _graph,
);
  String? get correct => _correct;
  String? get notAnswered => _notAnswered;
  String? get incorrect => _incorrect;
  String? get pass => _pass;
  String? get fail => _fail;
  String? get latestPass => _latestPass;
  String? get latestFail => _latestFail;
  List<Graph>? get graph => _graph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['correct'] = _correct;
    map['not_answered'] = _notAnswered;
    map['incorrect'] = _incorrect;
    map['pass'] = _pass;
    map['fail'] = _fail;
    map['latest_pass'] = _latestPass;
    map['latest_fail'] = _latestFail;
    if (_graph != null) {
      map['graph'] = _graph?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// user_id : 20
/// type : "full"
/// correct_answer : "70"
/// not_answer : "3"
/// incorrect : "7"
/// created_at : "2023-01-31T12:41:24.000000Z"
/// result : "pass"
/// percentage : "87.50"

Graph graphFromJson(String str) => Graph.fromJson(json.decode(str));
String graphToJson(Graph data) => json.encode(data.toJson());
class Graph {
  Graph({
      num? id, 
      num? userId, 
      String? type, 
      String? correctAnswer, 
      String? notAnswer, 
      String? incorrect, 
      String? createdAt, 
      String? result, 
      String? percentage,}){
    _id = id;
    _userId = userId;
    _type = type;
    _correctAnswer = correctAnswer;
    _notAnswer = notAnswer;
    _incorrect = incorrect;
    _createdAt = createdAt;
    _result = result;
    _percentage = percentage;
}

  Graph.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _type = json['type'];
    _correctAnswer = json['correct_answer'];
    _notAnswer = json['not_answer'];
    _incorrect = json['incorrect'];
    _createdAt = json['created_at'];
    _result = json['result'];
    _percentage = json['percentage'];
  }
  num? _id;
  num? _userId;
  String? _type;
  String? _correctAnswer;
  String? _notAnswer;
  String? _incorrect;
  String? _createdAt;
  String? _result;
  String? _percentage;
Graph copyWith({  num? id,
  num? userId,
  String? type,
  String? correctAnswer,
  String? notAnswer,
  String? incorrect,
  String? createdAt,
  String? result,
  String? percentage,
}) => Graph(  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  correctAnswer: correctAnswer ?? _correctAnswer,
  notAnswer: notAnswer ?? _notAnswer,
  incorrect: incorrect ?? _incorrect,
  createdAt: createdAt ?? _createdAt,
  result: result ?? _result,
  percentage: percentage ?? _percentage,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get type => _type;
  String? get correctAnswer => _correctAnswer;
  String? get notAnswer => _notAnswer;
  String? get incorrect => _incorrect;
  String? get createdAt => _createdAt;
  String? get result => _result;
  String? get percentage => _percentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['correct_answer'] = _correctAnswer;
    map['not_answer'] = _notAnswer;
    map['incorrect'] = _incorrect;
    map['created_at'] = _createdAt;
    map['result'] = _result;
    map['percentage'] = _percentage;
    return map;
  }

}