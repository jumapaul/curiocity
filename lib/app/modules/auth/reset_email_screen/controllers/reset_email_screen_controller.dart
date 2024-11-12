import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/utils/constants.dart';
import '../../../../common/utils/show_toast.dart';
import '../../../../data/model/reset_password_otp_model.dart';
import 'package:http/http.dart' as http;

import '../../../../routes/app_pages.dart';

class ResetEmailScreenController extends GetxController {
  final emailEditTextController = TextEditingController();
  final Rx<RxStatus> _resetOtpStatus = Rx<RxStatus>(RxStatus.empty());

  RxStatus get resetOtpStatus => _resetOtpStatus.value;

  void sendResetOtp() async {
    try {
      _resetOtpStatus.value = RxStatus.loading();
      var url = Constants.resetOtpEndPoint;
      Map<String, String> requestHeaders = {"Accept": "json/application"};
      var body = ResetPasswordOtpModel(email: emailEditTextController.text);
      var response = await http.post(Uri.parse(url),
          body: body.toJson(), headers: requestHeaders);

      if (response.statusCode == 200 || response.statusCode == 201) {
        _resetOtpStatus.value = RxStatus.success();
        Get.toNamed(Routes.RESET_OTP_SCREEN,
            arguments: {'email': emailEditTextController.text})?.then((value) {
          emailEditTextController.clear();
        });
      } else {
        _resetOtpStatus.value = RxStatus.error();
        var errorMessage = jsonDecode(response.body);
        showToast(errorMessage['message']);
      }
    } catch (error) {
      _resetOtpStatus.value = RxStatus.error();
      showToast("Network error: $error");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
