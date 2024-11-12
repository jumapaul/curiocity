class ResetPasswordOtpModel {
  ResetPasswordOtpModel({
      this.email,});

  ResetPasswordOtpModel.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}