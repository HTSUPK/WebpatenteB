import 'dart:convert';
/// status : 200
/// message : "success"
/// data : [{"id":1,"lang":"en","chapter_id":3,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/hykgDeI7hmvvegGxc3b4PtbAuNxnGha6D9bwRjAy.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/Hg0UbjkZXmimvulf3xMDJt61A8UpT54tWyXetarv.mp3"},{"id":2,"lang":"hi","chapter_id":3,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/hykgDeI7hmvvegGxc3b4PtbAuNxnGha6D9bwRjAy.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/Hg0UbjkZXmimvulf3xMDJt61A8UpT54tWyXetarv.mp3"},{"id":3,"lang":"it","chapter_id":3,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/hykgDeI7hmvvegGxc3b4PtbAuNxnGha6D9bwRjAy.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/Hg0UbjkZXmimvulf3xMDJt61A8UpT54tWyXetarv.mp3"},{"id":4,"lang":"ur","chapter_id":3,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/hykgDeI7hmvvegGxc3b4PtbAuNxnGha6D9bwRjAy.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/Hg0UbjkZXmimvulf3xMDJt61A8UpT54tWyXetarv.mp3"},{"id":5,"lang":"en","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/pubD5YNWJ7ec9jedNQCYmzZGFpT1t9zGTsf3cy77.jpg","question":"Lorem Ipsum is simply dummy text of the printing and type setting industry.","ans":"0","audio":"uploads/question/audio/W3gjc2OLGo4vIESM99S5IfpIkFPzwNOBTHJ87nBq.mp3"},{"id":6,"lang":"hi","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/pubD5YNWJ7ec9jedNQCYmzZGFpT1t9zGTsf3cy77.jpg","question":"Lorem Ipsum is simply dummy text of the printing and type setting industry.","ans":"0","audio":"uploads/question/audio/W3gjc2OLGo4vIESM99S5IfpIkFPzwNOBTHJ87nBq.mp3"},{"id":7,"lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/pubD5YNWJ7ec9jedNQCYmzZGFpT1t9zGTsf3cy77.jpg","question":"Lorem Ipsum is simply dummy text of the printing and type setting industry.","ans":"0","audio":"uploads/question/audio/W3gjc2OLGo4vIESM99S5IfpIkFPzwNOBTHJ87nBq.mp3"},{"id":8,"lang":"ur","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/pubD5YNWJ7ec9jedNQCYmzZGFpT1t9zGTsf3cy77.jpg","question":"Lorem Ipsum is simply dummy text of the printing and type setting industry.","ans":"0","audio":"uploads/question/audio/W3gjc2OLGo4vIESM99S5IfpIkFPzwNOBTHJ87nBq.mp3"},{"id":9,"lang":"en","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/VypDhFFEhQDUKw5kjfpArO3gUUmavt5zX4Opv4EF.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/qlEil0kPnjXWzQaXAiJn7nbqAnzBpV9mfT02JzID.mp3"},{"id":10,"lang":"hi","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/VypDhFFEhQDUKw5kjfpArO3gUUmavt5zX4Opv4EF.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/qlEil0kPnjXWzQaXAiJn7nbqAnzBpV9mfT02JzID.mp3"},{"id":11,"lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/VypDhFFEhQDUKw5kjfpArO3gUUmavt5zX4Opv4EF.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/qlEil0kPnjXWzQaXAiJn7nbqAnzBpV9mfT02JzID.mp3"},{"id":12,"lang":"ur","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/VypDhFFEhQDUKw5kjfpArO3gUUmavt5zX4Opv4EF.png","question":"How important was the time period or the setting to the story?","ans":"1","audio":"uploads/question/audio/qlEil0kPnjXWzQaXAiJn7nbqAnzBpV9mfT02JzID.mp3"},{"id":13,"lang":"en","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/0ESSYlX1UkhYzSXg6K99JVzZoQbhVerT1RSwFhBg.png","question":"Physics Que For Bulk","ans":"1","audio":"uploads/question/audio/gllMCATJgU0cZrx8HlTywVQrxex8zreXNp4FhRZ2.mp3"},{"id":14,"lang":"hi","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/0ESSYlX1UkhYzSXg6K99JVzZoQbhVerT1RSwFhBg.png","question":"Physics Que For Bulk","ans":"1","audio":"uploads/question/audio/gllMCATJgU0cZrx8HlTywVQrxex8zreXNp4FhRZ2.mp3"},{"id":15,"lang":"it","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/0ESSYlX1UkhYzSXg6K99JVzZoQbhVerT1RSwFhBg.png","question":"Physics Que For Bulk","ans":"1","audio":"uploads/question/audio/gllMCATJgU0cZrx8HlTywVQrxex8zreXNp4FhRZ2.mp3"},{"id":16,"lang":"ur","chapter_id":2,"image":"https://hexeros.com/dev/web-patente/uploads/question/image/0ESSYlX1UkhYzSXg6K99JVzZoQbhVerT1RSwFhBg.png","question":"Physics Que For Bulk","ans":"1","audio":"uploads/question/audio/gllMCATJgU0cZrx8HlTywVQrxex8zreXNp4FhRZ2.mp3"}]

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));
String questionModelToJson(QuestionModel data) => json.encode(data.toJson());
class QuestionModel {
  QuestionModel({
      num? status, 
      String? message, 
      List<Data>? data,}){
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
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Data>? _data;
QuestionModel copyWith({  num? status,
  String? message,
  List<Data>? data,
}) => QuestionModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

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

/// id : 1
/// lang : "en"
/// chapter_id : 3
/// image : "https://hexeros.com/dev/web-patente/uploads/question/image/hykgDeI7hmvvegGxc3b4PtbAuNxnGha6D9bwRjAy.png"
/// question : "How important was the time period or the setting to the story?"
/// ans : "1"
/// audio : "uploads/question/audio/Hg0UbjkZXmimvulf3xMDJt61A8UpT54tWyXetarv.mp3"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? lang, 
      num? chapterId, 
      String? image, 
      String? question, 
      String? ans, 
      String? audio,}){
    _id = id;
    _lang = lang;
    _chapterId = chapterId;
    _image = image;
    _question = question;
    _ans = ans;
    _audio = audio;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _lang = json['lang'];
    _chapterId = json['chapter_id'];
    _image = json['image'];
    _question = json['question'];
    _ans = json['ans'];
    _audio = json['audio'];
  }
  num? _id;
  String? _lang;
  num? _chapterId;
  String? _image;
  String? _question;
  String? _ans;
  String? _audio;
Data copyWith({  num? id,
  String? lang,
  num? chapterId,
  String? image,
  String? question,
  String? ans,
  String? audio,
}) => Data(  id: id ?? _id,
  lang: lang ?? _lang,
  chapterId: chapterId ?? _chapterId,
  image: image ?? _image,
  question: question ?? _question,
  ans: ans ?? _ans,
  audio: audio ?? _audio,
);
  num? get id => _id;
  String? get lang => _lang;
  num? get chapterId => _chapterId;
  String? get image => _image;
  String? get question => _question;
  String? get ans => _ans;
  String? get audio => _audio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lang'] = _lang;
    map['chapter_id'] = _chapterId;
    map['image'] = _image;
    map['question'] = _question;
    map['ans'] = _ans;
    map['audio'] = _audio;
    return map;
  }

}