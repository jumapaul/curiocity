import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../common_widget/outlined_button.dart';
import '../controllers/on_board_screen_controller.dart';

class OnBoardScreenView extends GetView<OnBoardScreenController> {
  const OnBoardScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 31, right: 31, bottom: 40),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.updatePage(index);
                  },
                  itemCount: controller.pages.length,
                  itemBuilder: (context, index) {
                    return OnBoardContent(
                      description: controller.pages[index].description,
                      image: controller.pages[index].image,
                    );
                  },
                ),
              ),
              Obx(() {
                return DotIndicator(
                  totalPages: controller.pages.length,
                  currentPage: controller.currentPage.value,
                );
              }),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => Text(
                  controller.pages[controller.currentPage.value].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButtonWidget(
                onClick: () {
                  controller.saveOnBoardState(true);
                  Get.toNamed(Routes.LOGIN_SCREEN);
                },
                name: "Login",
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Or continue with"),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/facebook.png",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    "assets/images/google.png",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    "assets/images/apple-logo.png",
                    height: 30,
                    width: 30,
                    color: Get.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  final String description;
  final String image;

  const OnBoardContent(
      {super.key, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Flexible(
            child: Lottie.asset(
          image,
          backgroundLoading: true,
          animate: true,
        )),
        const SizedBox(height: 32),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const DotIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: currentPage == index ? 24 : 12,
            decoration: BoxDecoration(
                color: currentPage == index ? Colors.orangeAccent : Colors.grey,
                borderRadius: BorderRadius.circular(12)),
          );
        },
      ),
    );
  }
}
