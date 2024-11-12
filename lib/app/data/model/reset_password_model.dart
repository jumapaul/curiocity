class ResetPasswordModel {
  ResetPasswordModel({
      this.token, 
      this.password, 
      this.confirmPassword, 
      this.email,});

  ResetPasswordModel.fromJson(dynamic json) {
    token = json['token'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    email = json['email'];
  }
  String? token;
  String? password;
  String? confirmPassword;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['email'] = email;
    return map;
  }

}