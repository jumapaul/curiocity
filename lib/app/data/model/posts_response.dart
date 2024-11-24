class PostsResponse {
  PostsResponse({
      String? message, 
      bool? success, 
      List<Data>? data, 
      num? totalItems, 
      String? currentPage, 
      num? totalPages, 
      num? statusCode,}){
    _message = message;
    _success = success;
    _data = data;
    _totalItems = totalItems;
    _currentPage = currentPage;
    _totalPages = totalPages;
    _statusCode = statusCode;
}

  PostsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _totalItems = json['totalItems'];
    _currentPage = json['currentPage'];
    _totalPages = json['totalPages'];
    _statusCode = json['statusCode'];
  }
  String? _message;
  bool? _success;
  List<Data>? _data;
  num? _totalItems;
  String? _currentPage;
  num? _totalPages;
  num? _statusCode;
PostsResponse copyWith({  String? message,
  bool? success,
  List<Data>? data,
  num? totalItems,
  String? currentPage,
  num? totalPages,
  num? statusCode,
}) => PostsResponse(  message: message ?? _message,
  success: success ?? _success,
  data: data ?? _data,
  totalItems: totalItems ?? _totalItems,
  currentPage: currentPage ?? _currentPage,
  totalPages: totalPages ?? _totalPages,
  statusCode: statusCode ?? _statusCode,
);
  String? get message => _message;
  bool? get success => _success;
  List<Data>? get data => _data;
  num? get totalItems => _totalItems;
  String? get currentPage => _currentPage;
  num? get totalPages => _totalPages;
  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['totalItems'] = _totalItems;
    map['currentPage'] = _currentPage;
    map['totalPages'] = _totalPages;
    map['statusCode'] = _statusCode;
    return map;
  }

}

class Data {
  Data({
      String? id, 
      dynamic description, 
      bool? isEdited, 
      List<String>? categories, 
      List<String>? tags, 
      String? visibility, 
      dynamic location, 
      dynamic scheduledDate, 
      bool? isScheduled, 
      User? user, 
      List<PostMedias>? postMedias, 
      num? comments, 
      num? upVotes, 
      num? downVotes, 
      List<String>? bookmarks, 
      String? createdAt,}){
    _id = id;
    _description = description;
    _isEdited = isEdited;
    _categories = categories;
    _tags = tags;
    _visibility = visibility;
    _location = location;
    _scheduledDate = scheduledDate;
    _isScheduled = isScheduled;
    _user = user;
    _postMedias = postMedias;
    _comments = comments;
    _upVotes = upVotes;
    _downVotes = downVotes;
    _bookmarks = bookmarks;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _isEdited = json['isEdited'];
    _categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _visibility = json['visibility'];
    _location = json['location'];
    _scheduledDate = json['scheduledDate'];
    _isScheduled = json['isScheduled'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['postMedias'] != null) {
      _postMedias = [];
      json['postMedias'].forEach((v) {
        _postMedias?.add(PostMedias.fromJson(v));
      });
    }
    _comments = json['comments'];
    _upVotes = json['upVotes'];
    _downVotes = json['downVotes'];
    _bookmarks = json['bookmarks'] != null ? json['bookmarks'].cast<String>() : [];
    _createdAt = json['createdAt'];
  }
  String? _id;
  dynamic _description;
  bool? _isEdited;
  List<String>? _categories;
  List<String>? _tags;
  String? _visibility;
  dynamic _location;
  dynamic _scheduledDate;
  bool? _isScheduled;
  User? _user;
  List<PostMedias>? _postMedias;
  num? _comments;
  num? _upVotes;
  num? _downVotes;
  List<String>? _bookmarks;
  String? _createdAt;
Data copyWith({  String? id,
  dynamic description,
  bool? isEdited,
  List<String>? categories,
  List<String>? tags,
  String? visibility,
  dynamic location,
  dynamic scheduledDate,
  bool? isScheduled,
  User? user,
  List<PostMedias>? postMedias,
  num? comments,
  num? upVotes,
  num? downVotes,
  List<String>? bookmarks,
  String? createdAt,
}) => Data(  id: id ?? _id,
  description: description ?? _description,
  isEdited: isEdited ?? _isEdited,
  categories: categories ?? _categories,
  tags: tags ?? _tags,
  visibility: visibility ?? _visibility,
  location: location ?? _location,
  scheduledDate: scheduledDate ?? _scheduledDate,
  isScheduled: isScheduled ?? _isScheduled,
  user: user ?? _user,
  postMedias: postMedias ?? _postMedias,
  comments: comments ?? _comments,
  upVotes: upVotes ?? _upVotes,
  downVotes: downVotes ?? _downVotes,
  bookmarks: bookmarks ?? _bookmarks,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  dynamic get description => _description;
  bool? get isEdited => _isEdited;
  List<String>? get categories => _categories;
  List<String>? get tags => _tags;
  String? get visibility => _visibility;
  dynamic get location => _location;
  dynamic get scheduledDate => _scheduledDate;
  bool? get isScheduled => _isScheduled;
  User? get user => _user;
  List<PostMedias>? get postMedias => _postMedias;
  num? get comments => _comments;
  num? get upVotes => _upVotes;
  num? get downVotes => _downVotes;
  List<String>? get bookmarks => _bookmarks;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['isEdited'] = _isEdited;
    map['categories'] = _categories;
    map['tags'] = _tags;
    map['visibility'] = _visibility;
    map['location'] = _location;
    map['scheduledDate'] = _scheduledDate;
    map['isScheduled'] = _isScheduled;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_postMedias != null) {
      map['postMedias'] = _postMedias?.map((v) => v.toJson()).toList();
    }
    map['comments'] = _comments;
    map['upVotes'] = _upVotes;
    map['downVotes'] = _downVotes;
    map['bookmarks'] = _bookmarks;
    map['createdAt'] = _createdAt;
    return map;
  }

}

class PostMedias {
  PostMedias({
      String? id, 
      String? url, 
      String? type,}){
    _id = id;
    _url = url;
    _type = type;
}

  PostMedias.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _type = json['type'];
  }
  String? _id;
  String? _url;
  String? _type;
PostMedias copyWith({  String? id,
  String? url,
  String? type,
}) => PostMedias(  id: id ?? _id,
  url: url ?? _url,
  type: type ?? _type,
);
  String? get id => _id;
  String? get url => _url;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['type'] = _type;
    return map;
  }

}

class User {
  User({
      String? name, 
      String? email, 
      String? profilePictureUrl, 
      String? id,}){
    _name = name;
    _email = email;
    _profilePictureUrl = profilePictureUrl;
    _id = id;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _profilePictureUrl = json['profilePictureUrl'];
    _id = json['id'];
  }
  String? _name;
  String? _email;
  String? _profilePictureUrl;
  String? _id;
User copyWith({  String? name,
  String? email,
  String? profilePictureUrl,
  String? id,
}) => User(  name: name ?? _name,
  email: email ?? _email,
  profilePictureUrl: profilePictureUrl ?? _profilePictureUrl,
  id: id ?? _id,
);
  String? get name => _name;
  String? get email => _email;
  String? get profilePictureUrl => _profilePictureUrl;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['profilePictureUrl'] = _profilePictureUrl;
    map['id'] = _id;
    return map;
  }

}