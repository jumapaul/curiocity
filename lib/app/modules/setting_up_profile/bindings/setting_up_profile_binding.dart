import 'package:get/get.dart';

import '../controllers/setting_up_profile_controller.dart';

class SettingUpProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingUpProfileController>(
      () => SettingUpProfileController(),
    );
  }
}
