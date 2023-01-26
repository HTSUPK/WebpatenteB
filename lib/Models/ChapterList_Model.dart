import 'dart:convert';
/// status : 200
/// message : "success"
/// data : [{"id":2,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/nMGGVZnxADkgm7wAHuDBn454lU0x4araCXISwVLq.png","chapter":"A Little Story"},{"id":3,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/CCgsSgxZMkVpdHkRmBkTEXBUpPoG4Z2gRX7QOQHe.png","chapter":"Legends Of USA"}]

ChapterListModel chapterListModelFromJson(String str) => ChapterListModel.fromJson(json.decode(str));
String chapterListModelToJson(ChapterListModel data) => json.encode(data.toJson());
class ChapterListModel {
  ChapterListModel({
      num? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ChapterListModel.fromJson(dynamic json) {
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
ChapterListModel copyWith({  num? status,
  String? message,
  List<Data>? data,
}) => ChapterListModel(  status: status ?? _status,
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

/// id : 2
/// image : "https://hexeros.com/dev/web-patente/uploads/chapter/nMGGVZnxADkgm7wAHuDBn454lU0x4araCXISwVLq.png"
/// chapter : "A Little Story"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? image, 
      String? chapter,}){
    _id = id;
    _image = image;
    _chapter = chapter;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _chapter = json['chapter'];
  }
  num? _id;
  String? _image;
  String? _chapter;
Data copyWith({  num? id,
  String? image,
  String? chapter,
}) => Data(  id: id ?? _id,
  image: image ?? _image,
  chapter: chapter ?? _chapter,
);
  num? get id => _id;
  String? get image => _image;
  String? get chapter => _chapter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['chapter'] = _chapter;
    return map;
  }

}