import 'package:get/get.dart';

import '../controllers/verify_email_screen_controller.dart';

class VerifyEmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailScreenController>(
      () => VerifyEmailScreenController(),
    );
  }
}
