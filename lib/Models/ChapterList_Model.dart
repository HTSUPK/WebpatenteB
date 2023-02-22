import 'dart:convert';

ChapterListModel chapterListModelFromJson(String str) => ChapterListModel.fromJson(json.decode(str));

String chapterListModelToJson(ChapterListModel data) => json.encode(data.toJson());

class ChapterListModel {
  ChapterListModel({
    int? status,
    String? message,
    Data? data,
  }) {
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

  ChapterListModel copyWith({
    int? status,
    String? message,
    Data? data,
  }) =>
      ChapterListModel(
        status: status ?? _status,
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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    List<ChapterList>? chapterList,
    List<PageList>? pageList,
  }) {
    _chapterList = chapterList;
    _pageList = pageList;
  }

  Data.fromJson(dynamic json) {
    if (json['Chapter'] != null) {
      _chapterList = [];
      json['Chapter'].forEach((v) {
        _chapterList?.add(ChapterList.fromJson(v));
      });
    }
    if (json['Page'] != null) {
      _pageList = [];
      json['Page'].forEach((v) {
        _pageList?.add(PageList.fromJson(v));
      });
    }
  }

  List<ChapterList>? _chapterList;
  List<PageList>? _pageList;

  Data copyWith({
    List<ChapterList>? chapterList,
    List<PageList>? pageList,
  }) =>
      Data(
        chapterList: chapterList ?? _chapterList,
        pageList: pageList ?? _pageList,
      );

  List<ChapterList>? get chapterList => _chapterList;

  List<PageList>? get pageList => _pageList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_chapterList != null) {
      map['Chapter'] = _chapterList?.map((v) => v.toJson()).toList();
    }
    if (_pageList != null) {
      map['Page'] = _pageList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 4
/// sequence : 1
/// title : "Definizioni stradali: la strada [01012]"
/// chapter_id : 6
/// chapter : {"id":6,"image":"https://hexeros.com/dev/web-patente/uploads/chapter/BonQx3IR86GUs0GJyBGkBU5twhTchXkQVQB6oMTI.png","chapter":"1. Definizioni generali e doveri nell'uso della strada","timer":20,"status":"active","created_at":"2023-02-06T07:51:15.000000Z","updated_at":"2023-02-06T10:40:05.000000Z"}

PageList pageListFromJson(String str) => PageList.fromJson(json.decode(str));

String pageListToJson(PageList data) => json.encode(data.toJson());

class PageList {
  PageList({
    int? id,
    int? sequence,
    String? title,
    int? chapterId,
    Chapter? chapter,
  }) {
    _id = id;
    _sequence = sequence;
    _title = title;
    _chapterId = chapterId;
    _chapter = chapter;
  }

  PageList.fromJson(dynamic json) {
    _id = json['id'];
    _sequence = json['sequence'];
    _title = json['title'];
    _chapterId = json['chapter_id'];
    _chapter = json['chapter'] != null ? Chapter.fromJson(json['chapter']) : null;
  }

  int? _id;
  int? _sequence;
  String? _title;
  int? _chapterId;
  Chapter? _chapter;

  PageList copyWith({
    int? id,
    int? sequence,
    String? title,
    int? chapterId,
    Chapter? chapter,
  }) =>
      PageList(
        id: id ?? _id,
        sequence: sequence ?? _sequence,
        title: title ?? _title,
        chapterId: chapterId ?? _chapterId,
        chapter: chapter ?? _chapter,
      );

  int? get id => _id;

  int? get sequence => _sequence;

  String? get title => _title;

  int? get chapterId => _chapterId;

  Chapter? get chapter => _chapter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sequence'] = _sequence;
    map['title'] = _title;
    map['chapter_id'] = _chapterId;
    if (_chapter != null) {
      map['chapter'] = _chapter?.toJson();
    }
    return map;
  }
}

/// id : 6
/// image : "https://hexeros.com/dev/web-patente/uploads/chapter/BonQx3IR86GUs0GJyBGkBU5twhTchXkQVQB6oMTI.png"
/// chapter : "1. Definizioni generali e doveri nell'uso della strada"
/// timer : 20
/// status : "active"
/// created_at : "2023-02-06T07:51:15.000000Z"
/// updated_at : "2023-02-06T10:40:05.000000Z"

Chapter chapterFromJson(String str) => Chapter.fromJson(json.decode(str));

String chapterToJson(Chapter data) => json.encode(data.toJson());

class Chapter {
  Chapter({
    int? id,
    String? image,
    String? chapter,
    int? timer,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
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

  int? _id;
  String? _image;
  String? _chapter;
  int? _timer;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  Chapter copyWith({
    int? id,
    String? image,
    String? chapter,
    int? timer,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) =>
      Chapter(
        id: id ?? _id,
        image: image ?? _image,
        chapter: chapter ?? _chapter,
        timer: timer ?? _timer,
        status: status ?? _status,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get image => _image;

  String? get chapter => _chapter;

  int? get timer => _timer;

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

ChapterList chapterListFromJson(String str) => ChapterList.fromJson(json.decode(str));

String chapterListToJson(Chapter data) => json.encode(data.toJson());

class ChapterList {
  ChapterList({
    int? id,
    String? image,
    String? chapter,
    List<Page>? page,
  }) {
    _id = id;
    _image = image;
    _chapter = chapter;
    _page = page;
  }

  ChapterList.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _chapter = json['chapter'];
    if (json['page'] != null) {
      _page = [];
      json['page'].forEach((v) {
        _page?.add(Page.fromJson(v));
      });
    }
  }

  int? _id;
  String? _image;
  String? _chapter;
  List<Page>? _page;

  ChapterList copyWith({
    int? id,
    String? image,
    String? chapter,
    List<Page>? page,
  }) =>
      ChapterList(
        id: id ?? _id,
        image: image ?? _image,
        chapter: chapter ?? _chapter,
        page: page ?? _page,
      );

  int? get id => _id;

  String? get image => _image;

  String? get chapter => _chapter;

  List<Page>? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['chapter'] = _chapter;
    if (_page != null) {
      map['page'] = _page?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 4
/// sequence : 1
/// chapter_id : 6
/// title : "Definizioni stradali: la strada [01012]"
/// created_at : "2023-02-06T08:26:14.000000Z"
/// updated_at : "2023-02-15T16:09:23.000000Z"

Page pageFromJson(String str) => Page.fromJson(json.decode(str));

String pageToJson(Page data) => json.encode(data.toJson());

class Page {
  Page({
    int? id,
    int? sequence,
    int? chapterId,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _sequence = sequence;
    _chapterId = chapterId;
    _title = title;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Page.fromJson(dynamic json) {
    _id = json['id'];
    _sequence = json['sequence'];
    _chapterId = json['chapter_id'];
    _title = json['title'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _sequence;
  int? _chapterId;
  String? _title;
  String? _createdAt;
  String? _updatedAt;

  Page copyWith({
    int? id,
    int? sequence,
    int? chapterId,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) =>
      Page(
        id: id ?? _id,
        sequence: sequence ?? _sequence,
        chapterId: chapterId ?? _chapterId,
        title: title ?? _title,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get sequence => _sequence;

  int? get chapterId => _chapterId;

  String? get title => _title;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sequence'] = _sequence;
    map['chapter_id'] = _chapterId;
    map['title'] = _title;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
