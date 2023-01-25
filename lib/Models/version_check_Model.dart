import 'dart:convert';
/// status : 200
/// message : "success"
/// data : {"is_force_update":"0"}

VersionCheckModel versionCheckModelFromJson(String str) => VersionCheckModel.fromJson(json.decode(str));
String versionCheckModelToJson(VersionCheckModel data) => json.encode(data.toJson());
class VersionCheckModel {
  VersionCheckModel({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  VersionCheckModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
VersionCheckModel copyWith({  num? status,
  String? message,
  Data? data,
}) => VersionCheckModel(  status: status ?? _status,
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

/// is_force_update : "0"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? isForceUpdate,}){
    _isForceUpdate = isForceUpdate;
}

  Data.fromJson(dynamic json) {
    _isForceUpdate = json['is_force_update'];
  }
  String? _isForceUpdate;
Data copyWith({  String? isForceUpdate,
}) => Data(  isForceUpdate: isForceUpdate ?? _isForceUpdate,
);
  String? get isForceUpdate => _isForceUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_force_update'] = _isForceUpdate;
    return map;
  }

}