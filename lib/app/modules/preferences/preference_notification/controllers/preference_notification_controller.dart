import 'package:get/get.dart';

class PreferenceNotificationController extends GetxController {
  var arguments = RxMap<String, dynamic>();
  final preferences = RxMap<String, bool>({
    "notification": false,
    "email": false,
    "personalize": false,
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
