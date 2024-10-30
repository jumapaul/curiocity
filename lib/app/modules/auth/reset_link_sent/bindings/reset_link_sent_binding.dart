import 'package:get/get.dart';

import '../controllers/reset_link_sent_controller.dart';

class ResetLinkSentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetLinkSentController>(
      () => ResetLinkSentController(),
    );
  }
}
