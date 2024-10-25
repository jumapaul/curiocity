import 'package:curiocity/app/modules/common_widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../auth/login_screen/views/login_screen_view.dart';
import '../controllers/on_board_screen_controller.dart';

class OnBoardScreenView extends GetView<OnBoardScreenController> {
  const OnBoardScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
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
              OutlinedButtonWidget(
                  onClick: () {
                    Get.to(const LoginScreenView());
                  },
                  name: "Login"),
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
                  Image.asset("assets/images/facebook.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/google.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/apple-logo.png"),
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
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        )
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
      children: List.generate(totalPages, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
              color: currentPage == index ? Colors.orangeAccent : Colors.grey,
              borderRadius: BorderRadius.circular(12)),
        );
      }),
    );
  }
}
