import 'dart:async';

import 'package:get/get.dart';

class ResetPasswordScreenController extends GetxController {

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

  void resetTimer() {
    start.value = 59;
    startTimer();
  }
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override void dispose() {
    _timer.cancel();
    super.dispose();
  }

}
