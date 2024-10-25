import 'package:get/get.dart';

import '../controllers/on_board_screen_controller.dart';

class OnBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardScreenController>(
      () => OnBoardScreenController(),
    );
  }
}
