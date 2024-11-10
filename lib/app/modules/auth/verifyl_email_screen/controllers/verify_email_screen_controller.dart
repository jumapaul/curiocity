import 'dart:async';
import 'dart:convert';

import 'package:curiocity/app/common/utils/constants.dart';
import 'package:curiocity/app/common/utils/show_toast.dart';
import 'package:get/get.dart';

import '../../../../data/model/verify_otp_model.dart';
import 'package:http/http.dart' as http;

import '../../../../routes/app_pages.dart';

class VerifyEmailScreenController extends GetxController {
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

  verifyEmail(String? otp) async {
    try {
      var url = Constants.verifyEmailEndPoint;
      Map<String, String> requestHeaders = {'Accept': 'application/json'};

      var body = VerifyOtpModel(token: otp);
      var response = await http.post(Uri.parse(url),
          headers: requestHeaders, body: body.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.LOGIN_SCREEN);
      } else {
        String errorMessage =
            jsonDecode(response.body)['message'] ?? "An error occurred";
        showToast(errorMessage);
      }
    } catch (error) {
      showToast("Network Error: ${error.toString()}");
    }
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
