import 'package:get/get.dart';

import '../controllers/reset_email_screen_controller.dart';

class ResetEmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetEmailScreenController>(
      () => ResetEmailScreenController(),
    );
  }
}
