class UpdateUserProfileRequest {
  UpdateUserProfileRequest({
      String? email, 
      String? name, 
      String? dateOfBirth, 
      String? location, 
      List<String>? interests, 
      List<String>? subInterests, 
      bool? pushNotification, 
      bool? emailNotification, 
      bool? personalizedContent, 
      String? bio, 
      String? gender, 
      String? profileImage, 
      String? phone, 
      String? address, 
      String? city, 
      String? country,}){
    _email = email;
    _name = name;
    _dateOfBirth = dateOfBirth;
    _location = location;
    _interests = interests;
    _subInterests = subInterests;
    _pushNotification = pushNotification;
    _emailNotification = emailNotification;
    _personalizedContent = personalizedContent;
    _bio = bio;
    _gender = gender;
    _profileImage = profileImage;
    _phone = phone;
    _address = address;
    _city = city;
    _country = country;
}

  UpdateUserProfileRequest.fromJson(dynamic json) {
    _email = json['email'];
    _name = json['name'];
    _dateOfBirth = json['dateOfBirth'];
    _location = json['location'];
    _interests = json['interests'] != null ? json['interests'].cast<String>() : [];
    _subInterests = json['subInterests'] != null ? json['subInterests'].cast<String>() : [];
    _pushNotification = json['push_notification'];
    _emailNotification = json['email_notification'];
    _personalizedContent = json['personalized_content'];
    _bio = json['bio'];
    _gender = json['gender'];
    _profileImage = json['profile_image'];
    _phone = json['phone'];
    _address = json['address'];
    _city = json['city'];
    _country = json['country'];
  }
  String? _email;
  String? _name;
  String? _dateOfBirth;
  String? _location;
  List<String>? _interests;
  List<String>? _subInterests;
  bool? _pushNotification;
  bool? _emailNotification;
  bool? _personalizedContent;
  String? _bio;
  String? _gender;
  String? _profileImage;
  String? _phone;
  String? _address;
  String? _city;
  String? _country;
UpdateUserProfileRequest copyWith({  String? email,
  String? name,
  String? dateOfBirth,
  String? location,
  List<String>? interests,
  List<String>? subInterests,
  bool? pushNotification,
  bool? emailNotification,
  bool? personalizedContent,
  String? bio,
  String? gender,
  String? profileImage,
  String? phone,
  String? address,
  String? city,
  String? country,
}) => UpdateUserProfileRequest(  email: email ?? _email,
  name: name ?? _name,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  location: location ?? _location,
  interests: interests ?? _interests,
  subInterests: subInterests ?? _subInterests,
  pushNotification: pushNotification ?? _pushNotification,
  emailNotification: emailNotification ?? _emailNotification,
  personalizedContent: personalizedContent ?? _personalizedContent,
  bio: bio ?? _bio,
  gender: gender ?? _gender,
  profileImage: profileImage ?? _profileImage,
  phone: phone ?? _phone,
  address: address ?? _address,
  city: city ?? _city,
  country: country ?? _country,
);
  String? get email => _email;
  String? get name => _name;
  String? get dateOfBirth => _dateOfBirth;
  String? get location => _location;
  List<String>? get interests => _interests;
  List<String>? get subInterests => _subInterests;
  bool? get pushNotification => _pushNotification;
  bool? get emailNotification => _emailNotification;
  bool? get personalizedContent => _personalizedContent;
  String? get bio => _bio;
  String? get gender => _gender;
  String? get profileImage => _profileImage;
  String? get phone => _phone;
  String? get address => _address;
  String? get city => _city;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['name'] = _name;
    map['dateOfBirth'] = _dateOfBirth;
    map['location'] = _location;
    map['interests'] = _interests;
    map['subInterests'] = _subInterests;
    map['push_notification'] = _pushNotification;
    map['email_notification'] = _emailNotification;
    map['personalized_content'] = _personalizedContent;
    map['bio'] = _bio;
    map['gender'] = _gender;
    map['profile_image'] = _profileImage;
    map['phone'] = _phone;
    map['address'] = _address;
    map['city'] = _city;
    map['country'] = _country;
    return map;
  }

}