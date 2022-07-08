class HomeBannerModel {
  final List<Data>? data;
  final Links? links;
  final Meta? meta;
  final bool? status;
  final String? message;
  final int? statusCode;

  HomeBannerModel({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.message,
    this.statusCode,
  });

  HomeBannerModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        links = (json['links'] as Map<String, dynamic>?) != null
            ? Links.fromJson(json['links'] as Map<String, dynamic>)
            : null,
        meta = (json['meta'] as Map<String, dynamic>?) != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        status = json['status'] as bool?,
        message = json['message'] as String?,
        statusCode = json['statusCode'] as int?;

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'message': message,
        'statusCode': statusCode
      };
}

class Data {
  final int? id;
  final String? name;
  final String? image;
  final String? url;
  final bool? hide;
  final String? createdAt;

  Data({
    this.id,
    this.name,
    this.image,
    this.url,
    this.hide,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        url = json['url'] as String?,
        hide = json['hide'] as bool?,
        createdAt = json['createdAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'url': url,
        'hide': hide,
        'createdAt': createdAt
      };
}

class Links {
  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links.fromJson(Map<String, dynamic> json)
      : first = json['first'] as String?,
        last = json['last'] as String?,
        prev = json['prev'],
        next = json['next'];

  Map<String, dynamic> toJson() =>
      {'first': first, 'last': last, 'prev': prev, 'next': next};
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Links>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        links = (json['links'] as List?)
            ?.map((dynamic e) => Links.fromJson(e as Map<String, dynamic>))
            .toList(),
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'links': links?.map((e) => e.toJson()).toList(),
        'path': path,
        'per_page': perPage,
        'to': to,
        'total': total
      };
}
