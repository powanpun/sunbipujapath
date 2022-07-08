// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromMap(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromMap(String str) => LoginResponseModel.fromMap(json.decode(str));

String loginResponseModelToMap(LoginResponseModel data) => json.encode(data.toMap());

class LoginResponseModel {
  LoginResponseModel({
    this.data,
    this.status,
    this.message,
    this.statusCode,
  });

  LoginModel? data;
  bool? status;
  String? message;
  int? statusCode;

  LoginResponseModel copyWith({
    LoginModel? data,
    bool? status,
    String? message,
    int? statusCode,
  }) =>
      LoginResponseModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
      );

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
    data: json["data"] == null ? null : LoginModel.fromMap(json["data"]),
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : data?.toMap(),
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class LoginModel {
  LoginModel({
    this.id,
    this.name,
    this.email,
    this.rashi,
    this.countryCode,
    this.phone,
    this.avatar,
    this.accessToken,
    this.tokenType,
  });

  int? id;
  String? name;
  String? email;
  Rashi? rashi;
  String? countryCode;
  String? phone;
  String? avatar;
  String? accessToken;
  String? tokenType;

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    rashi: json["rashi"] == null ? null : Rashi.fromMap(json["rashi"]),
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    phone: json["phone"] == null ? null : json["phone"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
    tokenType: json["tokenType"] == null ? null : json["tokenType"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "rashi": rashi == null ? null : rashi?.toMap(),
    "countryCode": countryCode == null ? null : countryCode,
    "phone": phone == null ? null : phone,
    "avatar": avatar == null ? null : avatar,
    "accessToken": accessToken == null ? null : accessToken,
    "tokenType": tokenType == null ? null : tokenType,
  };
}

class Rashi {
  Rashi({
    this.id,
    this.rashi,
    this.horoscope,
    this.slug,
    this.image,
    this.names,
    this.dobFrom,
    this.dobTo,
    this.createdAt,
  });

  int? id;
  String? rashi;
  String? horoscope;
  String? slug;
  String? image;
  String? names;
  String? dobFrom;
  String? dobTo;
  dynamic createdAt;

  factory Rashi.fromMap(Map<String, dynamic> json) => Rashi(
    id: json["id"] == null ? null : json["id"],
    rashi: json["rashi"] == null ? null : json["rashi"],
    horoscope: json["horoscope"] == null ? null : json["horoscope"],
    slug: json["slug"] == null ? null : json["slug"],
    image: json["image"] == null ? null : json["image"],
    names: json["names"] == null ? null : json["names"],
    dobFrom: json["dobFrom"] == null ? null : json["dobFrom"],
    dobTo: json["dobTo"] == null ? null : json["dobTo"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "rashi": rashi == null ? null : rashi,
    "horoscope": horoscope == null ? null : horoscope,
    "slug": slug == null ? null : slug,
    "image": image == null ? null : image,
    "names": names == null ? null : names,
    "dobFrom": dobFrom == null ? null : dobFrom,
    "dobTo": dobTo == null ? null : dobTo,
    "createdAt": createdAt,
  };
}
