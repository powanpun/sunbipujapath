class AratiModel {
  AratiModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
    required this.statusCode,
  });
  late final List<Data> data;
  late final Links links;
  late final Meta meta;
  late final bool status;
  late final String message;
  late final int statusCode;

  AratiModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['links'] = links.toJson();
    _data['meta'] = meta.toJson();
    _data['status'] = status;
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.podcastCategory,
    required this.coverImage,
    required this.type,
    required this.podcastType,
    required this.price,
    required this.presenter,
    required this.featured,
    required this.description,
    required this.duration,
    required this.link,
    required this.audio,
    required this.createdAt,
  });
  late final int id;
  late final String title;
  late final PodcastCategory podcastCategory;
  late final String coverImage;
  late final String type;
  late final String podcastType;
  late final int price;
  late final String presenter;
  late final bool featured;
  late final String description;
  late final String duration;
  late final String link;
  late final String audio;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    podcastCategory = PodcastCategory.fromJson(json['podcastCategory']);
    coverImage = json['coverImage'];
    type = json['type'];
    podcastType = json['podcastType'];
    price = json['price'];
    presenter = json['presenter'];
    featured = json['featured'];
    description = json['description'];
    duration = json['duration'];
    link = json['link'];
    audio = json['audio'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['podcastCategory'] = podcastCategory.toJson();
    _data['coverImage'] = coverImage;
    _data['type'] = type;
    _data['podcastType'] = podcastType;
    _data['price'] = price;
    _data['presenter'] = presenter;
    _data['featured'] = featured;
    _data['description'] = description;
    _data['duration'] = duration;
    _data['link'] = link;
    _data['audio'] = audio;
    _data['createdAt'] = createdAt;
    return _data;
  }
}

class PodcastCategory {
  PodcastCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.createdAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String description;
  late final String createdAt;

  PodcastCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['description'] = description;
    _data['createdAt'] = createdAt;
    return _data;
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });
  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json){
    first = json['first'];
    last = json['last'];
    prev = null;
    next = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first'] = first;
    _data['last'] = last;
    _data['prev'] = prev;
    _data['next'] = next;
    return _data;
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}