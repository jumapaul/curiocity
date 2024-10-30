import 'package:curiocity/app/modules/preferences/user_category_preference/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCategoryPreferenceController extends GetxController {
  var categories = RxList<Category>();

  @override
  void onInit() {
    createDummyCategory();
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

  void createDummyCategory() {
    categories.addAll([
      Category(icon: Icons.copy_sharp, title: "Lifestyle", selected: false),
      Category(
          icon: Icons.copy_sharp, title: "Culture & Heritage", selected: false),
      Category(
          icon: Icons.copy_sharp, title: "Nature & Outdoors", selected: false),
      Category(
          icon: Icons.copy_sharp, title: "Social Community", selected: false),
    ]);
  }
}
