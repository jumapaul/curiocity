class TopicsResponse {
  TopicsResponse({
      List<CurioCategory>? data,
      String? message, 
      bool? success, 
      num? statusCode,}){
    _data = data;
    _message = message;
    _success = success;
    _statusCode = statusCode;
}

  TopicsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CurioCategory.fromJson(v));
      });
    }
    _message = json['message'];
    _success = json['success'];
    _statusCode = json['statusCode'];
  }
  List<CurioCategory>? _data;
  String? _message;
  bool? _success;
  num? _statusCode;
TopicsResponse copyWith({  List<CurioCategory>? data,
  String? message,
  bool? success,
  num? statusCode,
}) => TopicsResponse(  data: data ?? _data,
  message: message ?? _message,
  success: success ?? _success,
  statusCode: statusCode ?? _statusCode,
);
  List<CurioCategory>? get data => _data;
  String? get message => _message;
  bool? get success => _success;
  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['success'] = _success;
    map['statusCode'] = _statusCode;
    return map;
  }

}

class CurioCategory {
  CurioCategory({
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? name, 
      String? description, 
      List<Topic>? topics,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _name = name;
    _description = description;
    _topics = topics;
}

  CurioCategory.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _name = json['name'];
    _description = json['description'];
    if (json['topics'] != null) {
      _topics = [];
      json['topics'].forEach((v) {
        _topics?.add(Topic.fromJson(v));
      });
    }
  }
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _name;
  String? _description;
  List<Topic>? _topics;
CurioCategory copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? name,
  String? description,
  List<Topic>? topics,
}) => CurioCategory(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  name: name ?? _name,
  description: description ?? _description,
  topics: topics ?? _topics,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get name => _name;
  String? get description => _description;
  List<Topic>? get topics => _topics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['name'] = _name;
    map['description'] = _description;
    if (_topics != null) {
      map['topics'] = _topics?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Topic {
  Topic({
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? name, 
      String? description,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _name = name;
    _description = description;
}

  Topic.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _name = json['name'];
    _description = json['description'];
  }
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _name;
  String? _description;
Topic copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? name,
  String? description,
}) => Topic(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  name: name ?? _name,
  description: description ?? _description,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get name => _name;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['name'] = _name;
    map['description'] = _description;
    return map;
  }

}