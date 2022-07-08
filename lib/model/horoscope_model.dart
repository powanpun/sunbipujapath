class HoroscopeModel {
  HoroscopeModel({
    required this.data,
    required this.status,
    required this.message,
    required this.statusCode,
  });
  late final List<Data> data;
  late final bool status;
  late final String message;
  late final int statusCode;

  HoroscopeModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.rashi,
    required this.horoscope,
    required this.slug,
    required this.image,
    required this.names,
    required this.dobFrom,
    required this.dobTo,
    this.createdAt,
  });
  late final int id;
  late final String rashi;
  late final String horoscope;
  late final String slug;
  late final String image;
  late final String names;
  late final String dobFrom;
  late final String dobTo;
  late final Null createdAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    rashi = json['rashi'];
    horoscope = json['horoscope'];
    slug = json['slug'];
    image = json['image'];
    names = json['names'];
    dobFrom = json['dobFrom'];
    dobTo = json['dobTo'];
    createdAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['rashi'] = rashi;
    _data['horoscope'] = horoscope;
    _data['slug'] = slug;
    _data['image'] = image;
    _data['names'] = names;
    _data['dobFrom'] = dobFrom;
    _data['dobTo'] = dobTo;
    _data['createdAt'] = createdAt;
    return _data;
  }
}