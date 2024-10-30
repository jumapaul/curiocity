import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyEmailScreenController extends GetxController {
  var confirmCodeController = TextEditingController();
  late Timer _timer;
  RxInt start = 59.obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (start.value == 0) {
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    startTimer();
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
