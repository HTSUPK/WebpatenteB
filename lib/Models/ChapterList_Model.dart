import 'dart:convert';
/// status : 200
/// message : "success"
/// data : {"Chapter":[{"id":2,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/siXuMwyFHOYvsE874OFzsCjnFj18r5HSoftSMtxf.png","chapter":"A Little Story"},{"id":3,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/1mLpgZvlqnqNSaOT0P4x3xOpWCa33yi1icm2WRDt.jpg","chapter":"Legends Of USA"},{"id":5,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/FCA24iBIKPdOmSs55LXXlYE6fJGijnAFQwKqq507.gif","chapter":"Test"}],"Page":[{"id":1,"sequence":1,"title":"New page"},{"id":2,"sequence":2,"title":"Simple page"},{"id":3,"sequence":3,"title":"Drawing Page"}]}

ChapterListModel chapterListModelFromJson(String str) => ChapterListModel.fromJson(json.decode(str));
String chapterListModelToJson(ChapterListModel data) => json.encode(data.toJson());
class ChapterListModel {
  ChapterListModel({
      int? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ChapterListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _status;
  String? _message;
  Data? _data;
ChapterListModel copyWith({  int? status,
  String? message,
  Data? data,
}) => ChapterListModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  int? get status => _status;
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

/// Chapter : [{"id":2,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/siXuMwyFHOYvsE874OFzsCjnFj18r5HSoftSMtxf.png","chapter":"A Little Story"},{"id":3,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/1mLpgZvlqnqNSaOT0P4x3xOpWCa33yi1icm2WRDt.jpg","chapter":"Legends Of USA"},{"id":5,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/FCA24iBIKPdOmSs55LXXlYE6fJGijnAFQwKqq507.gif","chapter":"Test"}]
/// Page : [{"id":1,"sequence":1,"title":"New page"},{"id":2,"sequence":2,"title":"Simple page"},{"id":3,"sequence":3,"title":"Drawing Page"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<ChapterList>? chapter,
      List<Page>? page,}){
    _chapter = chapter;
    _page = page;
}

  Data.fromJson(dynamic json) {
    if (json['Chapter'] != null) {
      _chapter = [];
      json['Chapter'].forEach((v) {
        _chapter?.add(ChapterList.fromJson(v));
      });
    }
    if (json['Page'] != null) {
      _page = [];
      json['Page'].forEach((v) {
        _page?.add(Page.fromJson(v));
      });
    }
  }
  List<ChapterList>? _chapter;
  List<Page>? _page;
Data copyWith({  List<ChapterList>? chapter,
  List<Page>? page,
}) => Data(  chapter: chapter ?? _chapter,
  page: page ?? _page,
);
  List<ChapterList>? get chapter => _chapter;
  List<Page>? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_chapter != null) {
      map['Chapter'] = _chapter?.map((v) => v.toJson()).toList();
    }
    if (_page != null) {
      map['Page'] = _page?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// sequence : 1
/// title : "New page"

Page pageFromJson(String str) => Page.fromJson(json.decode(str));
String pageToJson(Page data) => json.encode(data.toJson());
class Page {
  Page({
      int? id, 
      int? sequence, 
      String? title,}){
    _id = id;
    _sequence = sequence;
    _title = title;
}

  Page.fromJson(dynamic json) {
    _id = json['id'];
    _sequence = json['sequence'];
    _title = json['title'];
  }
  int? _id;
  int? _sequence;
  String? _title;
Page copyWith({  int? id,
  int? sequence,
  String? title,
}) => Page(  id: id ?? _id,
  sequence: sequence ?? _sequence,
  title: title ?? _title,
);
  int? get id => _id;
  int? get sequence => _sequence;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sequence'] = _sequence;
    map['title'] = _title;
    return map;
  }

}

/// id : 2
/// image : "https://hexeros.com/dev/web-patente/uploads/chapter/siXuMwyFHOYvsE874OFzsCjnFj18r5HSoftSMtxf.png"
/// chapter : "A Little Story"

ChapterList chapterFromJson(String str) => ChapterList.fromJson(json.decode(str));
String chapterToJson(ChapterList data) => json.encode(data.toJson());
class ChapterList {
  ChapterList({
      int? id, 
      String? image, 
      String? chapter,}){
    _id = id;
    _image = image;
    _chapter = chapter;
}

  ChapterList.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _chapter = json['chapter'];
  }
  int? _id;
  String? _image;
  String? _chapter;
ChapterList copyWith({  int? id,
  String? image,
  String? chapter,
}) => ChapterList(  id: id ?? _id,
  image: image ?? _image,
  chapter: chapter ?? _chapter,
);
  int? get id => _id;
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