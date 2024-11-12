import 'dart:convert';

import 'package:curiocity/app/common/utils/constants.dart';
import 'package:curiocity/app/common/utils/show_toast.dart';
import 'package:curiocity/app/data/model/reset_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  final passwordEditTextController = TextEditingController();
  final confirmPasswordEditTextController = TextEditingController();

  final _status = Rx(RxStatus.empty());

  RxStatus get status => _status.value;

  void resetPassword() async {
    try {
      _status.value = RxStatus.loading();
      final Map<String, dynamic> arguments =
          Get.arguments as Map<String, dynamic>;
      var url = Constants.resetPasswordOtp;
      Map<String, String> requestHeaders = {'accept': 'application/json'};
      var body = ResetPasswordModel(
          token: arguments['otp'],
          password: passwordEditTextController.text,
          email: arguments['email'],
          confirmPassword: confirmPasswordEditTextController.text);

      var response = await http.post(Uri.parse(url),
          body: body.toJson(), headers: requestHeaders);

      if (response.statusCode == 200 || response.statusCode == 201) {
        _status.value = RxStatus.success();
        Get.toNamed(Routes.LOGIN_SCREEN)?.then((value) {
          passwordEditTextController.clear();
          confirmPasswordEditTextController.clear();
        });
      } else {
        _status.value = RxStatus.error();
        var errorMessage = jsonDecode(response.body);
        showToast(errorMessage['message']);
      }
    } catch (error) {
      _status.value = RxStatus.error();
      showToast("Network error: ${error.toString()}");
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
