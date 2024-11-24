import 'dart:convert';

import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/data/providers/shared_preferences.dart';
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

  getOptions() {
    var data = {
      "categories": selectedCategories.map((c) => c.id).toList().join("#"),
      "topics": selectedTopics.map((t) => t.id).toList().join("#")
    };
    return data;
  }
}
