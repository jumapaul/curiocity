import 'package:get/get.dart';

import '../controllers/user_category_preference_controller.dart';

class UserCategoryPreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCategoryPreferenceController>(
      () => UserCategoryPreferenceController(),
    );
  }
}
