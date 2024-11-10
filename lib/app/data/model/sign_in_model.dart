class SignInModel {
  SignInModel({
      this.email, 
      this.password,});

  SignInModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}