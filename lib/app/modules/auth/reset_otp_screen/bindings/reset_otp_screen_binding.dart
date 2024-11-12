import 'package:get/get.dart';

import '../controllers/reset_otp_screen_controller.dart';

class ResetOtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetOtpScreenController>(
      () => ResetOtpScreenController(),
    );
  }
}
