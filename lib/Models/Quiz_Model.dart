import 'dart:convert';
/// status : 200
/// message : "success"
/// data : [{"id":1,"image":"https://hexeros.com/dev/web-patente/uploads/quiz/image/rioute3y60lju2VwafT88TPJ4maKDq9odHKRnULB.png","chapter_id":2,"question":"we","answer":"true","audio":"uploads/quiz/audio/Y6j8ilJ2eANvgsJgMaYgapSQ75TmmYc6bOECHmyT.mp3","chapter":{"id":2,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/siXuMwyFHOYvsE874OFzsCjnFj18r5HSoftSMtxf.png","chapter":"A Little Story","timer":20,"status":"active","created_at":"2023-01-17T07:27:05.000000Z","updated_at":"2023-01-31T04:42:13.000000Z"}}]
/// Timer : "20"

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));
String quizModelToJson(QuizModel data) => json.encode(data.toJson());
class QuizModel {
  QuizModel({
      num? status, 
      String? message, 
      List<QuizData>? data,
      int? timer,}){
    _status = status;
    _message = message;
    _data = data;
    _timer = timer;
}

  QuizModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(QuizData.fromJson(v));
      });
    }
    _timer = json['Timer'];
  }
  num? _status;
  String? _message;
  List<QuizData>? _data;
  int? _timer;
QuizModel copyWith({  num? status,
  String? message,
  List<QuizData>? data,
  int? timer,
}) => QuizModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  timer: timer ?? _timer,
);
  num? get status => _status;
  String? get message => _message;
  List<QuizData>? get data => _data;
  int? get timer => _timer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['Timer'] = _timer;
    return map;
  }

}

/// id : 1
/// image : "https://hexeros.com/dev/web-patente/uploads/quiz/image/rioute3y60lju2VwafT88TPJ4maKDq9odHKRnULB.png"
/// chapter_id : 2
/// question : "we"
/// answer : "true"
/// audio : "uploads/quiz/audio/Y6j8ilJ2eANvgsJgMaYgapSQ75TmmYc6bOECHmyT.mp3"
/// chapter : {"id":2,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/siXuMwyFHOYvsE874OFzsCjnFj18r5HSoftSMtxf.png","chapter":"A Little Story","timer":20,"status":"active","created_at":"2023-01-17T07:27:05.000000Z","updated_at":"2023-01-31T04:42:13.000000Z"}

QuizData dataFromJson(String str) => QuizData.fromJson(json.decode(str));
String dataToJson(QuizData data) => json.encode(data.toJson());
class QuizData {
  QuizData({
      num? id, 
      String? image, 
      num? chapterId, 
      String? question, 
      String? answer, 
      String? audio, 
      Chapter? chapter,}){
    _id = id;
    _image = image;
    _chapterId = chapterId;
    _question = question;
    _answer = answer;
    _audio = audio;
    _chapter = chapter;
}

  QuizData.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _chapterId = json['chapter_id'];
    _question = json['question'];
    _answer = json['ans'];
    _audio = json['audio'];
    _chapter = json['quiz_chapter'] != null ? Chapter.fromJson(json['chapter']) : null;
  }
  num? _id;
  String? _image;
  num? _chapterId;
  String? _question;
  String? _answer;
  String? _audio;
  Chapter? _chapter;
QuizData copyWith({  num? id,
  String? image,
  num? chapterId,
  String? question,
  String? answer,
  String? audio,
  Chapter? chapter,
}) => QuizData(  id: id ?? _id,
  image: image ?? _image,
  chapterId: chapterId ?? _chapterId,
  question: question ?? _question,
  answer: answer ?? _answer,
  audio: audio ?? _audio,
  chapter: chapter ?? _chapter,
);
  num? get id => _id;
  String? get image => _image;
  num? get chapterId => _chapterId;
  String? get question => _question;
  String? get answer => _answer;
  String? get audio => _audio;
  Chapter? get chapter => _chapter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['chapter_id'] = _chapterId;
    map['question'] = _question;
    map['ans'] = _answer;
    map['audio'] = _audio;
    if (_chapter != null) {
      map['quiz_chapter'] = _chapter?.toJson();
    }
    return map;
  }

}

/// id : 2
/// image : "https://hexeros.com/dev/web-patente/uploads/chapter/siXuMwyFHOYvsE874OFzsCjnFj18r5HSoftSMtxf.png"
/// chapter : "A Little Story"
/// timer : 20
/// status : "active"
/// created_at : "2023-01-17T07:27:05.000000Z"
/// updated_at : "2023-01-31T04:42:13.000000Z"

Chapter chapterFromJson(String str) => Chapter.fromJson(json.decode(str));
String chapterToJson(Chapter data) => json.encode(data.toJson());
class Chapter {
  Chapter({
      num? id, 
      String? image, 
      String? chapter, 
      num? timer, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _image = image;
    _chapter = chapter;
    _timer = timer;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Chapter.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _chapter = json['chapter'];
    _timer = json['timer'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _image;
  String? _chapter;
  num? _timer;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Chapter copyWith({  num? id,
  String? image,
  String? chapter,
  num? timer,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Chapter(  id: id ?? _id,
  image: image ?? _image,
  chapter: chapter ?? _chapter,
  timer: timer ?? _timer,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get image => _image;
  String? get chapter => _chapter;
  num? get timer => _timer;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['chapter'] = _chapter;
    map['timer'] = _timer;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}