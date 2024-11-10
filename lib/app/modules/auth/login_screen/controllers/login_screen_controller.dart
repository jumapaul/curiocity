import 'dart:async';
import 'dart:convert';

import 'package:curiocity/app/common/utils/constants.dart';
import 'package:curiocity/app/common/utils/show_toast.dart';
import 'package:curiocity/app/data/model/sign_in_model.dart';
import 'package:curiocity/app/data/model/user_model.dart';
import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../routes/app_pages.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rxn<String>? emailErrorMessage = Rxn();
  Rxn<String>? confirmErrorMessage = Rxn();
  Rxn<String>? passwordErrorMessage = Rxn();
  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());

  RxStatus get status => _status.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future<UserModel> signIn() async {
    try {
      _status.value = RxStatus.loading();
      var url = Constants.signInEndPoint;
      Map<String, String> requestHeader = {'Accept': 'application/json'};
      bool passwordValid = isPasswordValid(passwordController.text);
      bool emailValid = validEmail(emailAddressController.text);

      if (emailValid && passwordValid) {
        var signInBody = SignInModel(
            email: emailAddressController.text,
            password: passwordController.text);

        var response = await http.post(Uri.parse(url),
            headers: requestHeader, body: signInBody.toJson());

        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          _status.value = RxStatus.success();
          //Decode the response body
          SharedPreferenceHelper.saveUser(responseBody);
          Get.toNamed(Routes.USER_CATEGORY_PREFERENCE);
        }else{
          _status.value = RxStatus.error();
          showToast(responseBody['message']);
        }
      }else{
        _status.value = RxStatus.error();
      }
    } catch (error) {
      _status.value = RxStatus.error();
      showToast("Network error: ${error.toString()}");
    }

    return UserModel();
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
