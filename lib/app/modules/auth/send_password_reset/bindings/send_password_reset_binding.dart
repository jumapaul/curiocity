import 'package:get/get.dart';

import '../controllers/send_password_reset_controller.dart';

class SendPasswordResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendPasswordResetController>(
      () => SendPasswordResetController(),
    );
  }
}
