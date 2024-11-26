class BookmarkResponse {
  BookmarkResponse({
      String? message, 
      bool? success, 
      num? statusCode,}){
    _message = message;
    _success = success;
    _statusCode = statusCode;
}

  BookmarkResponse.fromJson(dynamic json) {
    _message = json['message'];
    _success = json['success'];
    _statusCode = json['statusCode'];
  }
  String? _message;
  bool? _success;
  num? _statusCode;
BookmarkResponse copyWith({  String? message,
  bool? success,
  num? statusCode,
}) => BookmarkResponse(  message: message ?? _message,
  success: success ?? _success,
  statusCode: statusCode ?? _statusCode,
);
  String? get message => _message;
  bool? get success => _success;
  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['success'] = _success;
    map['statusCode'] = _statusCode;
    return map;
  }

}