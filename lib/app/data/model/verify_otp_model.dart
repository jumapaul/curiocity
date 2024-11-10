class VerifyOtpModel {
  VerifyOtpModel({
      this.token,});

  VerifyOtpModel.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}