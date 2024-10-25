import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final showPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
