import 'dart:convert';
import 'package:curiocity/app/common/utils/constants.dart';
import 'package:curiocity/app/common/utils/show_toast.dart';
import 'package:curiocity/app/data/model/sign_up_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../routes/app_pages.dart';

class SignUpScreenController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Rxn<String>? emailErrorMessage = Rxn();
  Rxn<String>? confirmErrorMessage = Rxn();
  Rxn<String>? passwordErrorMessage = Rxn();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  signUp() async {
    try {
      var url = Constants.signUpEndPoint;
      Map<String, String> requestHeaders = {'Accept': 'application/json'};

      bool passwordSame = confirmPassword(
          passwordController.text, confirmPasswordController.text);

      bool passWordValid = isPasswordValid(passwordController.text);

      if (validEmail(emailAddressController.text) &&
          fullNameController.text.isNotEmpty &&
          passwordSame &&
          passWordValid) {
        var user = SignUpModel(
          name: fullNameController.text,
          email: emailAddressController.text,
          password: passwordController.text,
        );

        var response = await http.post(Uri.parse(url),
            headers: requestHeaders, body: user.toJson());

        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.toNamed(Routes.LOGIN_SCREEN,
              arguments: emailAddressController.text);
        } else {
          String errorMessage =
              jsonDecode(response.body)['message'] ?? "An error occurred";
          showToast(errorMessage);
        }
      }
    } catch (error) {
      showToast("Network error: ${error.toString()}");
    }
  }

  bool validEmail(String email) {
    bool isValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);

    if (email.isEmpty) {
      emailErrorMessage?.value = "Email cannot be empty";
      return false;
    } else if (!isValid) {
      emailErrorMessage?.value = "invalid email format";
      return false;
    }
    return true;
  }

  bool confirmPassword(String password, String confirmPassword) {
    bool isSame = password == confirmPassword;

    if (password.isNotEmpty && confirmPassword.isNotEmpty && !isSame) {
      confirmErrorMessage?.value = "Confirm password not same as password";
      return true;
    }
    return true;
  }

  bool isPasswordValid(String password) {
    if (password.isEmpty) {
      passwordErrorMessage?.value = "Password cannot be empty";
      return false;
    } else if (password.length < 6) {
      passwordErrorMessage?.value = "Password cannot be less than 6 characters";
      return false;
    }
    return true;
  }
}
