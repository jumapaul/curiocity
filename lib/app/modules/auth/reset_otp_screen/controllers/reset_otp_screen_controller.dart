import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import '../../../../common/utils/constants.dart';
import '../../../../common/utils/show_toast.dart';
import '../../../../data/model/reset_password_otp_model.dart';
import 'package:http/http.dart' as http;
class ResetOtpScreenController extends GetxController {

  late Timer _timer;
  RxInt start = 59.obs;

  final Rx<RxStatus> _resendResetOtpStatus = Rx<RxStatus>(RxStatus.empty());
  RxStatus get resetOtpStatus => _resendResetOtpStatus.value;

  void resendResetOtp(String email) async {
    try {
      _resendResetOtpStatus.value = RxStatus.loading();
      var url = Constants.resetOtpEndPoint;
      Map<String, String> requestHeaders = {"Accept": "json/application"};
      var body = ResetPasswordOtpModel(email: email);
      var response = await http.post(Uri.parse(url),
          body: body.toJson(), headers: requestHeaders);

      if (response.statusCode == 200 || response.statusCode == 201) {
        _resendResetOtpStatus.value = RxStatus.success();
      } else {
        _resendResetOtpStatus.value = RxStatus.error();
        var errorMessage = jsonDecode(response.body);
        showToast(errorMessage['message']);
      }
    } catch (error) {
      _resendResetOtpStatus.value = RxStatus.error();
      showToast("Network error: $error");
    }
  }

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