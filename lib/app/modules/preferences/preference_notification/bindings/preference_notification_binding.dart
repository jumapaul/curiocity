import 'package:get/get.dart';

import '../controllers/preference_notification_controller.dart';

class PreferenceNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceNotificationController>(
      () => PreferenceNotificationController(),
    );
  }
}
