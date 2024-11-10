import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/on_board_model.dart';

class OnBoardScreenController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();
  final List<OnBoardModel> pages = [
    OnBoardModel(
        description: "Discover.Explore.Anything. Anywhere.Anytime",
        image: 'assets/images/splash_one.gif'),
    OnBoardModel(
        description: "Discover spaces and curios around you",
        image: 'assets/images/splash_two.gif'),
    OnBoardModel(
        description: "Find people and communities that love what you enjoy",
        image: 'assets/images/splash_three.gif'),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose;
    super.dispose();
  }

  void updatePage(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void saveOnBoardState(bool onBoardState) async {
    await SharedPreferenceHelper.saveOnBoardState(onBoardState);
  }
}
