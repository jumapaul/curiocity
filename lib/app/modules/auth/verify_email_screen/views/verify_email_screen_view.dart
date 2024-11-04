import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widget/outlined_button.dart';
import '../../login_screen/views/widget/InputTextFieldWidget.dart';
import '../controllers/verify_email_screen_controller.dart';

class VerifyEmailScreenView extends GetView<VerifyEmailScreenController> {
  const VerifyEmailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: mediumSize),
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
        padding: const EdgeInsets.symmetric(horizontal: mediumSize),
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: mediumSize,
                ),
                const Text(
                  "Verify",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: largeSize,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "We sent an email verification code to your email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: normalSize,
                  ),
                ),
                const SizedBox(
                  height: extraExtraLargeSize,
                ),
                InputTextFieldWidget(
                  hintText: "Type your code here",
                  labelText: "Enter code",
                  editingController: controller.confirmCodeController,
                ),
                const SizedBox(
                  height: extraExtraLargeSize,
                ),
                OutlinedButtonWidget(
                  onClick: () {
                    //todo
                  },
                  name: "Verify",
                ),
                const SizedBox(
                  height: mediumSize,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                          "00:${controller.start.value.toString().padLeft(2, '0')}"),
                      const SizedBox(
                        height: mediumSize,
                      ),
                      const Text(
                        "Resend code",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
