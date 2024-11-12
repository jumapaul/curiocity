import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/dimens/dimens.dart';
import '../../../../common/utils/show_toast.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/reset_otp_screen_controller.dart';

class ResetOtpScreenView extends GetView<ResetOtpScreenController> {
  const ResetOtpScreenView({super.key});

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
            final Map<String, dynamic> arguments =
                Get.arguments as Map<String, dynamic>;

            final currentEmail = arguments['email'];
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
                Text(
                  "Enter otp sent to $currentEmail",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: normalSize,
                  ),
                ),
                const SizedBox(
                  height: extraExtraLargeSize,
                ),
                _verifyOtpWidget(currentEmail),
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
                      TextButton(
                        onPressed: () {
                          if (controller.start != 0) {
                            showToast("Try after ${controller.start.value}");
                          } else {
                            controller.resetTimer();
                            controller.resendResetOtp(currentEmail);
                          }
                        },
                        child: controller.resetOtpStatus.isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                ),
                              )
                            : Text(
                                "Resend Otp",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color,
                                ),
                              ),
                      ),
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

  Widget _verifyOtpWidget(String email) {
    final defaultTheme = PinTheme(
        width: 50,
        height: 50,
        textStyle: const TextStyle(color: Colors.black),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)));
    return Pinput(
      length: 6,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyWith(
          decoration: defaultTheme.decoration!
              .copyWith(border: Border.all(color: Colors.orangeAccent))),
      onCompleted: (otp) {
        Get.toNamed(Routes.RESET_PASSWORD,
            arguments: {'email': email, 'otp': otp});
        // controller.verifyEmail(otp);
      },
    );
  }
}
