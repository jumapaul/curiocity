class UserModel {
  UserModel({
      this.data, 
      this.message, 
      this.success, 
      this.statusCode,});

  UserModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
    statusCode = json['statusCode'];
  }
  Data? data;
  String? message;
  bool? success;
  num? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['success'] = success;
    map['statusCode'] = statusCode;
    return map;
  }

}

class Data {
  Data({
      this.user, 
      this.accessToken,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }
  User? user;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['accessToken'] = accessToken;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.email, 
      this.isActive, 
      this.isVerified, 
      this.name, 
      this.address, 
      this.city, 
      this.country, 
      this.pushNotification, 
      this.emailNotification, 
      this.personalizedContent, 
      this.longitude, 
      this.latitude, 
      this.subscription,});

  User.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    email = json['email'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    pushNotification = json['pushNotification'];
    emailNotification = json['emailNotification'];
    personalizedContent = json['personalizedContent'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    subscription = json['subscription'] != null ? Subscription.fromJson(json['subscription']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? email;
  bool? isActive;
  bool? isVerified;
  String? name;
  dynamic address;
  dynamic city;
  dynamic country;
  bool? pushNotification;
  bool? emailNotification;
  bool? personalizedContent;
  dynamic longitude;
  dynamic latitude;
  Subscription? subscription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    map['email'] = email;
    map['isActive'] = isActive;
    map['isVerified'] = isVerified;
    map['name'] = name;
    map['address'] = address;
    map['city'] = city;
    map['country'] = country;
    map['pushNotification'] = pushNotification;
    map['emailNotification'] = emailNotification;
    map['personalizedContent'] = personalizedContent;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    if (subscription != null) {
      map['subscription'] = subscription?.toJson();
    }
    return map;
  }

}

class Subscription {
  Subscription({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.startDate, 
      this.endDate,});

  Subscription.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? startDate;
  String? endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    return map;
  }

}