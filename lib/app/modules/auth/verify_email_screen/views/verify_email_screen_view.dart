import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common_widgets/outlined_button_widget.dart';
import '../../login_screen/views/widget/InputTextFieldWidget.dart';
import '../controllers/verify_email_screen_controller.dart';

class VerifyEmailScreenView extends GetView<VerifyEmailScreenController> {
  const VerifyEmailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(VerifyEmailScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Verify",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 35),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "We sent an email verification code to your email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InputTextFieldWidget(
                    hintText: "Type your code here",
                    editingController: controller.confirmCodeController),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButtonWidget(
                    onClick: () {
                      //todo
                    },
                    name: "Verify"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                          "00:${controller.start.value.toString().padLeft(2, '0')}"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Resend code")
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }
}
