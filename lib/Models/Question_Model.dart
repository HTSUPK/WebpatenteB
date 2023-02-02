import 'dart:convert';
/// status : 200
/// message : "success"
/// data : [{"id":27,"unique_id":"ID61263129","lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/NgfzV8bsAeR6H6S4vm9mVwvxJ50TnREmaAxEQinD.webp","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/JmrrbtwH3LwGy6G5G19s77XI6neauECDmYP7FO9u.mp3","page":1,"sequence":2,"status":"active","created_at":"2023-01-30T13:48:31.000000Z","updated_at":"2023-01-31T11:05:49.000000Z","language_texts":{"en":"How important was the time period or the setting to the story?","hi":"How important was the time period or the setting to the story?","ur":"How important was the time period or the setting to the story?"}},{"id":31,"unique_id":"ID90943648","lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/iwv1Z1grbvWXWJdl6dX0yzJQQxPln7rRAHCWdZug.png","question":"Who knows you best?","ans":"1","audio":"uploads/question/audio/Dj8kaPwgqUypKkwrjIttDvs12PtJ7WBuunRArHZT.mp3","page":1,"sequence":8,"status":"active","created_at":"2023-01-30T13:52:35.000000Z","updated_at":"2023-01-31T11:12:46.000000Z","language_texts":{"ur":"Who knows you best?"}},{"id":39,"unique_id":"ID02233222","lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/2W5jWL0LyvJ7u0yZ5eyvTpPpETcwiLS4XqOUn2tQ.png","question":"What do you enjoy spending money on?","ans":"1","audio":"uploads/question/audio/zPotgHp51gcodbEMEhrXoiUE4vPTFqfw1cPwHWTV.mp3","page":1,"sequence":10,"status":"active","created_at":"2023-01-31T05:15:25.000000Z","updated_at":"2023-01-31T11:14:07.000000Z","language_texts":{"en":"What do you enjoy spending money on?","hi":"What do you enjoy spending money on?","ur":"What do you enjoy spending money on?"}},{"id":51,"unique_id":"ID23558328","lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/DsLjPlVCwj0jZDWEDPmOIyhWlebVxkXjfbRGCweY.png","question":"What do you enjoy spending money on?","ans":"1","audio":"uploads/question/audio/BWtQoVmRRaTjNfE9lPP0chPcu1SNoJRMKvvqhOae.mp3","page":1,"sequence":12,"status":"active","created_at":"2023-01-31T05:21:50.000000Z","updated_at":"2023-01-31T11:12:46.000000Z","language_texts":{"en":"What do you enjoy spending money on?","hi":"What do you enjoy spending money on?","ur":"What do you enjoy spending money on?"}},{"id":59,"unique_id":"ID56033908","lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/uNJda9ETJMQvdXPTfPGq4GKzerg0OxckiO2AbGdy.jpg","question":"What is the greatest challenge or struggle you have ever faced?","ans":"1","audio":"uploads/question/audio/63YzQDPk9q1yp3ifoF9ooLcmUnH0n93j2fG9hqM4.mp3","page":1,"sequence":14,"status":"active","created_at":"2023-01-31T05:32:13.000000Z","updated_at":"2023-01-31T11:12:46.000000Z","language_texts":{"en":"What is the greatest challenge or struggle you have ever faced?","hi":"What is the greatest challenge or struggle you have ever faced?","ur":"What is the greatest challenge or struggle you have ever faced?"}}]

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));
String questionModelToJson(QuestionModel data) => json.encode(data.toJson());
class QuestionModel {
  QuestionModel({
      num? status, 
      String? message, 
      List<QuestionData>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  QuestionModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(QuestionData.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<QuestionData>? _data;
QuestionModel copyWith({  num? status,
  String? message,
  List<QuestionData>? data,
}) => QuestionModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  List<QuestionData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 27
/// unique_id : "ID61263129"
/// lang : "it"
/// chapter_id : 2
/// image : "https://hexeros.com/dev/web-patente/uploads/question/image/NgfzV8bsAeR6H6S4vm9mVwvxJ50TnREmaAxEQinD.webp"
/// question : "How important was the time period or the setting to the story?"
/// ans : "1"
/// audio : "uploads/question/audio/JmrrbtwH3LwGy6G5G19s77XI6neauECDmYP7FO9u.mp3"
/// page : 1
/// sequence : 2
/// status : "active"
/// created_at : "2023-01-30T13:48:31.000000Z"
/// updated_at : "2023-01-31T11:05:49.000000Z"
/// language_texts : {"en":"How important was the time period or the setting to the story?","hi":"How important was the time period or the setting to the story?","ur":"How important was the time period or the setting to the story?"}

QuestionData dataFromJson(String str) => QuestionData.fromJson(json.decode(str));
String dataToJson(QuestionData data) => json.encode(data.toJson());
class QuestionData {
  QuestionData({
      num? id, 
      String? uniqueId, 
      String? lang, 
      num? chapterId, 
      String? image, 
      String? question, 
      String? ans, 
      String? audio, 
      num? page, 
      num? sequence, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      LanguageTexts? languageTexts,}){
    _id = id;
    _uniqueId = uniqueId;
    _lang = lang;
    _chapterId = chapterId;
    _image = image;
    _question = question;
    _ans = ans;
    _audio = audio;
    _page = page;
    _sequence = sequence;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _languageTexts = languageTexts;
}

  QuestionData.fromJson(dynamic json) {
    _id = json['id'];
    _uniqueId = json['unique_id'];
    _lang = json['lang'];
    _chapterId = json['chapter_id'];
    _image = json['image'];
    _question = json['question'];
    _ans = json['ans'];
    _audio = json['audio'];
    _page = json['page'];
    _sequence = json['sequence'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _languageTexts = json['language_texts'] != null ? LanguageTexts.fromJson(json['language_texts']) : null;
  }
  num? _id;
  String? _uniqueId;
  String? _lang;
  num? _chapterId;
  String? _image;
  String? _question;
  String? _ans;
  String? _audio;
  num? _page;
  num? _sequence;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  LanguageTexts? _languageTexts;
QuestionData copyWith({  num? id,
  String? uniqueId,
  String? lang,
  num? chapterId,
  String? image,
  String? question,
  String? ans,
  String? audio,
  num? page,
  num? sequence,
  String? status,
  String? createdAt,
  String? updatedAt,
  LanguageTexts? languageTexts,
}) => QuestionData(  id: id ?? _id,
  uniqueId: uniqueId ?? _uniqueId,
  lang: lang ?? _lang,
  chapterId: chapterId ?? _chapterId,
  image: image ?? _image,
  question: question ?? _question,
  ans: ans ?? _ans,
  audio: audio ?? _audio,
  page: page ?? _page,
  sequence: sequence ?? _sequence,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  languageTexts: languageTexts ?? _languageTexts,
);
  num? get id => _id;
  String? get uniqueId => _uniqueId;
  String? get lang => _lang;
  num? get chapterId => _chapterId;
  String? get image => _image;
  String? get question => _question;
  String? get ans => _ans;
  String? get audio => _audio;
  num? get page => _page;
  num? get sequence => _sequence;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  LanguageTexts? get languageTexts => _languageTexts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['unique_id'] = _uniqueId;
    map['lang'] = _lang;
    map['chapter_id'] = _chapterId;
    map['image'] = _image;
    map['question'] = _question;
    map['ans'] = _ans;
    map['audio'] = _audio;
    map['page'] = _page;
    map['sequence'] = _sequence;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_languageTexts != null) {
      map['language_texts'] = _languageTexts?.toJson();
    }
    return map;
  }

}

/// en : "How important was the time period or the setting to the story?"
/// hi : "How important was the time period or the setting to the story?"
/// ur : "How important was the time period or the setting to the story?"

LanguageTexts languageTextsFromJson(String str) => LanguageTexts.fromJson(json.decode(str));
String languageTextsToJson(LanguageTexts data) => json.encode(data.toJson());
class LanguageTexts {
  LanguageTexts({
      String? en, 
      String? hi, 
      String? ur,}){
    _en = en;
    _hi = hi;
    _ur = ur;
}

  LanguageTexts.fromJson(dynamic json) {
    _en = json['en'];
    _hi = json['hi'];
    _ur = json['ur'];
  }
  String? _en;
  String? _hi;
  String? _ur;
LanguageTexts copyWith({  String? en,
  String? hi,
  String? ur,
}) => LanguageTexts(  en: en ?? _en,
  hi: hi ?? _hi,
  ur: ur ?? _ur,
);
  String? get en => _en;
  String? get hi => _hi;
  String? get ur => _ur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    map['hi'] = _hi;
    map['ur'] = _ur;
    return map;
  }

}