import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:get/get.dart';

class UserTopicPreferenceController extends GetxController {
  var selectedCategories = RxList<CurioCategory>();
  var topics = RxList<Topic>();

  var selectedTopics = RxList<Topic>();

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
