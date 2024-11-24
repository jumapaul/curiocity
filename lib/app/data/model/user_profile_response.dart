class UserProfileResponse {
  UserProfileResponse({
      String? message, 
      bool? success, 
      num? status, 
      Data? data,}){
    _message = message;
    _success = success;
    _status = status;
    _data = data;
}

  UserProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
    _success = json['success'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  bool? _success;
  num? _status;
  Data? _data;
UserProfileResponse copyWith({  String? message,
  bool? success,
  num? status,
  Data? data,
}) => UserProfileResponse(  message: message ?? _message,
  success: success ?? _success,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  bool? get success => _success;
  num? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['success'] = _success;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? email, 
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
      String? bio, 
      bool? pushNotification, 
      bool? emailNotification, 
      bool? personalizedContent, 
      List<String>? interests, 
      List<String>? subInterests, 
      num? longitude, 
      num? latitude, 
      Subscription? subscription,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _email = email;
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
    _bio = bio;
    _pushNotification = pushNotification;
    _emailNotification = emailNotification;
    _personalizedContent = personalizedContent;
    _interests = interests;
    _subInterests = subInterests;
    _longitude = longitude;
    _latitude = latitude;
    _subscription = subscription;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _email = json['email'];
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
    _bio = json['bio'];
    _pushNotification = json['pushNotification'];
    _emailNotification = json['emailNotification'];
    _personalizedContent = json['personalizedContent'];
    _interests = json['interests'] != null ? json['interests'].cast<String>() : [];
    _subInterests = json['subInterests'] != null ? json['subInterests'].cast<String>() : [];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _subscription = json['subscription'] != null ? Subscription.fromJson(json['subscription']) : null;
  }
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _email;
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
  String? _bio;
  bool? _pushNotification;
  bool? _emailNotification;
  bool? _personalizedContent;
  List<String>? _interests;
  List<String>? _subInterests;
  num? _longitude;
  num? _latitude;
  Subscription? _subscription;
Data copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? email,
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
  String? bio,
  bool? pushNotification,
  bool? emailNotification,
  bool? personalizedContent,
  List<String>? interests,
  List<String>? subInterests,
  num? longitude,
  num? latitude,
  Subscription? subscription,
}) => Data(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  email: email ?? _email,
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
  bio: bio ?? _bio,
  pushNotification: pushNotification ?? _pushNotification,
  emailNotification: emailNotification ?? _emailNotification,
  personalizedContent: personalizedContent ?? _personalizedContent,
  interests: interests ?? _interests,
  subInterests: subInterests ?? _subInterests,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
  subscription: subscription ?? _subscription,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get email => _email;
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
  String? get bio => _bio;
  bool? get pushNotification => _pushNotification;
  bool? get emailNotification => _emailNotification;
  bool? get personalizedContent => _personalizedContent;
  List<String>? get interests => _interests;
  List<String>? get subInterests => _subInterests;
  num? get longitude => _longitude;
  num? get latitude => _latitude;
  Subscription? get subscription => _subscription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['email'] = _email;
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
    map['bio'] = _bio;
    map['pushNotification'] = _pushNotification;
    map['emailNotification'] = _emailNotification;
    map['personalizedContent'] = _personalizedContent;
    map['interests'] = _interests;
    map['subInterests'] = _subInterests;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    if (_subscription != null) {
      map['subscription'] = _subscription?.toJson();
    }
    return map;
  }

}

class Subscription {
  Subscription({
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? startDate, 
      String? endDate,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _startDate = startDate;
    _endDate = endDate;
}

  Subscription.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
  }
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _startDate;
  String? _endDate;
Subscription copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  String? startDate,
  String? endDate,
}) => Subscription(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get startDate => _startDate;
  String? get endDate => _endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    return map;
  }

}