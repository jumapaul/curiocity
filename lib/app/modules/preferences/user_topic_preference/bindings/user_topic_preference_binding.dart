import 'package:get/get.dart';

import '../controllers/user_topic_preference_controller.dart';

class UserTopicPreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserTopicPreferenceController>(
      () => UserTopicPreferenceController(),
    );
  }
}
