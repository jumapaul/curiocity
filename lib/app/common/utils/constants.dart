import 'package:curiocity/app/data/providers/shared_preferences.dart';

class Constants{
  static const baseUrl = "https://dev-api.curiocitie.com";
  static const signUpEndPoint = "$baseUrl/api/v1/auth/signup";
  static const verifyEmailEndPoint = "$baseUrl/api/v1/auth/verify-otp";
  static const signInEndPoint = "$baseUrl/api/v1/auth/login";
  static const resetOtpEndPoint = "$baseUrl/api/v1/auth/send-reset-token";
  static const resetPasswordOtp = "$baseUrl/api/v1/auth/reset-password";
  static const verifyOtp = "$baseUrl/api/v1/auth/verify-otp";
  static Future<String?> token() async{
    String? token = await SharedPreferenceHelper.getToken();
    return token;
  }
}