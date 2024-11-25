class CommentsResponse {
  CommentsResponse({
      String? message, 
      bool? success, 
      List<Comment>? data,
      num? totalItems, 
      num? currentPage, 
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

  CommentsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Comment.fromJson(v));
      });
    }
    _totalItems = json['totalItems'];
    _currentPage = json['currentPage'];
    _totalPages = json['totalPages'];
    _statusCode = json['statusCode'];
  }
  String? _message;
  bool? _success;
  List<Comment>? _data;
  num? _totalItems;
  num? _currentPage;
  num? _totalPages;
  num? _statusCode;
CommentsResponse copyWith({  String? message,
  bool? success,
  List<Comment>? data,
  num? totalItems,
  num? currentPage,
  num? totalPages,
  num? statusCode,
}) => CommentsResponse(  message: message ?? _message,
  success: success ?? _success,
  data: data ?? _data,
  totalItems: totalItems ?? _totalItems,
  currentPage: currentPage ?? _currentPage,
  totalPages: totalPages ?? _totalPages,
  statusCode: statusCode ?? _statusCode,
);
  String? get message => _message;
  bool? get success => _success;
  List<Comment>? get data => _data;
  num? get totalItems => _totalItems;
  num? get currentPage => _currentPage;
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

class Comment {
  Comment({
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? content, 
      List<dynamic>? likes, 
      bool? isEdited, 
      User? user,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _content = content;
    _likes = likes;
    _isEdited = isEdited;
    _user = user;
}

  Comment.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _content = json['content'];
    if (json['likes'] != null) {
      _likes = [];
      json['likes'].forEach((v) {
        _likes?.add(v.fromJson(v));
      });
    }
    _isEdited = json['isEdited'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _content;
  List<dynamic>? _likes;
  bool? _isEdited;
  User? _user;
Comment copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? content,
  List<dynamic>? likes,
  bool? isEdited,
  User? user,
}) => Comment(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  content: content ?? _content,
  likes: likes ?? _likes,
  isEdited: isEdited ?? _isEdited,
  user: user ?? _user,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get content => _content;
  List<dynamic>? get likes => _likes;
  bool? get isEdited => _isEdited;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['content'] = _content;
    if (_likes != null) {
      map['likes'] = _likes?.map((v) => v.toJson()).toList();
    }
    map['isEdited'] = _isEdited;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? email, 
      String? password, 
      bool? isActive, 
      bool? isVerified, 
      String? name, 
      String? dateOfBirth, 
      dynamic gender, 
      String? profilePictureUrl, 
      String? phone, 
      dynamic address, 
      dynamic city, 
      dynamic country, 
      dynamic lastLogin, 
      String? resetPasswordToken, 
      String? resetPasswordExpires, 
      String? emailVerificationToken, 
      String? emailVerificationExpires, 
      String? bio, 
      bool? pushNotification, 
      bool? emailNotification, 
      bool? personalizedContent, 
      List<String>? interests, 
      List<String>? subInterests, 
      num? longitude, 
      num? latitude,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _email = email;
    _password = password;
    _isActive = isActive;
    _isVerified = isVerified;
    _name = name;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _profilePictureUrl = profilePictureUrl;
    _phone = phone;
    _address = address;
    _city = city;
    _country = country;
    _lastLogin = lastLogin;
    _resetPasswordToken = resetPasswordToken;
    _resetPasswordExpires = resetPasswordExpires;
    _emailVerificationToken = emailVerificationToken;
    _emailVerificationExpires = emailVerificationExpires;
    _bio = bio;
    _pushNotification = pushNotification;
    _emailNotification = emailNotification;
    _personalizedContent = personalizedContent;
    _interests = interests;
    _subInterests = subInterests;
    _longitude = longitude;
    _latitude = latitude;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _email = json['email'];
    _password = json['password'];
    _isActive = json['isActive'];
    _isVerified = json['isVerified'];
    _name = json['name'];
    _dateOfBirth = json['dateOfBirth'];
    _gender = json['gender'];
    _profilePictureUrl = json['profilePictureUrl'];
    _phone = json['phone'];
    _address = json['address'];
    _city = json['city'];
    _country = json['country'];
    _lastLogin = json['lastLogin'];
    _resetPasswordToken = json['resetPasswordToken'];
    _resetPasswordExpires = json['resetPasswordExpires'];
    _emailVerificationToken = json['emailVerificationToken'];
    _emailVerificationExpires = json['emailVerificationExpires'];
    _bio = json['bio'];
    _pushNotification = json['pushNotification'];
    _emailNotification = json['emailNotification'];
    _personalizedContent = json['personalizedContent'];
    _interests = json['interests'] != null ? json['interests'].cast<String>() : [];
    _subInterests = json['subInterests'] != null ? json['subInterests'].cast<String>() : [];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
  }
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _email;
  String? _password;
  bool? _isActive;
  bool? _isVerified;
  String? _name;
  String? _dateOfBirth;
  dynamic _gender;
  String? _profilePictureUrl;
  String? _phone;
  dynamic _address;
  dynamic _city;
  dynamic _country;
  dynamic _lastLogin;
  String? _resetPasswordToken;
  String? _resetPasswordExpires;
  String? _emailVerificationToken;
  String? _emailVerificationExpires;
  String? _bio;
  bool? _pushNotification;
  bool? _emailNotification;
  bool? _personalizedContent;
  List<String>? _interests;
  List<String>? _subInterests;
  num? _longitude;
  num? _latitude;
User copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? email,
  String? password,
  bool? isActive,
  bool? isVerified,
  String? name,
  String? dateOfBirth,
  dynamic gender,
  String? profilePictureUrl,
  String? phone,
  dynamic address,
  dynamic city,
  dynamic country,
  dynamic lastLogin,
  String? resetPasswordToken,
  String? resetPasswordExpires,
  String? emailVerificationToken,
  String? emailVerificationExpires,
  String? bio,
  bool? pushNotification,
  bool? emailNotification,
  bool? personalizedContent,
  List<String>? interests,
  List<String>? subInterests,
  num? longitude,
  num? latitude,
}) => User(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  email: email ?? _email,
  password: password ?? _password,
  isActive: isActive ?? _isActive,
  isVerified: isVerified ?? _isVerified,
  name: name ?? _name,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  gender: gender ?? _gender,
  profilePictureUrl: profilePictureUrl ?? _profilePictureUrl,
  phone: phone ?? _phone,
  address: address ?? _address,
  city: city ?? _city,
  country: country ?? _country,
  lastLogin: lastLogin ?? _lastLogin,
  resetPasswordToken: resetPasswordToken ?? _resetPasswordToken,
  resetPasswordExpires: resetPasswordExpires ?? _resetPasswordExpires,
  emailVerificationToken: emailVerificationToken ?? _emailVerificationToken,
  emailVerificationExpires: emailVerificationExpires ?? _emailVerificationExpires,
  bio: bio ?? _bio,
  pushNotification: pushNotification ?? _pushNotification,
  emailNotification: emailNotification ?? _emailNotification,
  personalizedContent: personalizedContent ?? _personalizedContent,
  interests: interests ?? _interests,
  subInterests: subInterests ?? _subInterests,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get email => _email;
  String? get password => _password;
  bool? get isActive => _isActive;
  bool? get isVerified => _isVerified;
  String? get name => _name;
  String? get dateOfBirth => _dateOfBirth;
  dynamic get gender => _gender;
  String? get profilePictureUrl => _profilePictureUrl;
  String? get phone => _phone;
  dynamic get address => _address;
  dynamic get city => _city;
  dynamic get country => _country;
  dynamic get lastLogin => _lastLogin;
  String? get resetPasswordToken => _resetPasswordToken;
  String? get resetPasswordExpires => _resetPasswordExpires;
  String? get emailVerificationToken => _emailVerificationToken;
  String? get emailVerificationExpires => _emailVerificationExpires;
  String? get bio => _bio;
  bool? get pushNotification => _pushNotification;
  bool? get emailNotification => _emailNotification;
  bool? get personalizedContent => _personalizedContent;
  List<String>? get interests => _interests;
  List<String>? get subInterests => _subInterests;
  num? get longitude => _longitude;
  num? get latitude => _latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['email'] = _email;
    map['password'] = _password;
    map['isActive'] = _isActive;
    map['isVerified'] = _isVerified;
    map['name'] = _name;
    map['dateOfBirth'] = _dateOfBirth;
    map['gender'] = _gender;
    map['profilePictureUrl'] = _profilePictureUrl;
    map['phone'] = _phone;
    map['address'] = _address;
    map['city'] = _city;
    map['country'] = _country;
    map['lastLogin'] = _lastLogin;
    map['resetPasswordToken'] = _resetPasswordToken;
    map['resetPasswordExpires'] = _resetPasswordExpires;
    map['emailVerificationToken'] = _emailVerificationToken;
    map['emailVerificationExpires'] = _emailVerificationExpires;
    map['bio'] = _bio;
    map['pushNotification'] = _pushNotification;
    map['emailNotification'] = _emailNotification;
    map['personalizedContent'] = _personalizedContent;
    map['interests'] = _interests;
    map['subInterests'] = _subInterests;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    return map;
  }

}