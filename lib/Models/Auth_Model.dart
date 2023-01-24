import 'dart:convert';
/// status : 200
/// message : "login successfully"
/// data : {"id":6,"name":"Test","email":"test@test.com","country_code":"+91","mobile":"9876543210","profile_image":"https://hexeros.com/dev/web-patente/uploads/user/user.png","token":"4lztnsiJnxnkj2YMorS7BdOTU2gD1K39yUyCjLEeadI20u3e2FAPvbGRar2EzFAD9GvNd53AaHMR8aTRfXP01mSY5gjD8GTl3GLj"}

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));
String authModelToJson(AuthModel data) => json.encode(data.toJson());
class AuthModel {
  AuthModel({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  AuthModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
AuthModel copyWith({  num? status,
  String? message,
  Data? data,
}) => AuthModel(  status: status ?? _status,
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

/// id : 6
/// name : "Test"
/// email : "test@test.com"
/// country_code : "+91"
/// mobile : "9876543210"
/// profile_image : "https://hexeros.com/dev/web-patente/uploads/user/user.png"
/// token : "4lztnsiJnxnkj2YMorS7BdOTU2gD1K39yUyCjLEeadI20u3e2FAPvbGRar2EzFAD9GvNd53AaHMR8aTRfXP01mSY5gjD8GTl3GLj"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? name, 
      String? email, 
      String? countryCode, 
      String? mobile, 
      String? profileImage, 
      String? token,}){
    _id = id;
    _name = name;
    _email = email;
    _countryCode = countryCode;
    _mobile = mobile;
    _profileImage = profileImage;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _countryCode = json['country_code'];
    _mobile = json['mobile'];
    _profileImage = json['profile_image'];
    _token = json['token'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _countryCode;
  String? _mobile;
  String? _profileImage;
  String? _token;
Data copyWith({  num? id,
  String? name,
  String? email,
  String? countryCode,
  String? mobile,
  String? profileImage,
  String? token,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  countryCode: countryCode ?? _countryCode,
  mobile: mobile ?? _mobile,
  profileImage: profileImage ?? _profileImage,
  token: token ?? _token,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get countryCode => _countryCode;
  String? get mobile => _mobile;
  String? get profileImage => _profileImage;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['country_code'] = _countryCode;
    map['mobile'] = _mobile;
    map['profile_image'] = _profileImage;
    map['token'] = _token;
    return map;
  }

}