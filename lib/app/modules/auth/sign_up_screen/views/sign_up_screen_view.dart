import 'package:curiocity/app/modules/auth/login_screen/views/login_screen_view.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/sign_in_and_up_row.dart';
import 'package:curiocity/app/modules/common_widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpScreenController());
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/curio.png")),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Create an account to get started",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            InputTextFieldWidget(
                hintText: "Enter your fullname",
                editingController: controller.fullNameController),
            const SizedBox(
              height: 15,
            ),
            InputTextFieldWidget(
                hintText: "Enter your email address",
                editingController: controller.emailAddressController),
            const SizedBox(
              height: 15,
            ),
            PasswordTextFieldWidget(
                hintText: "Create password",
                passwordTextEditController: controller.passwordController),
            const SizedBox(
              height: 15,
            ),
            PasswordTextFieldWidget(
                hintText: "Confirm password",
                passwordTextEditController:
                    controller.confirmPasswordController),
            const SizedBox(
              height: 15,
            ),
            SignInAndUpRow(
                desc: "By signing up you agree to our",
                action: "Terms and condition",
                onClick: () {
                  //todo
                }),
            const SizedBox(
              height: 15,
            ),
            OutlinedButtonWidget(
              onClick: () {
                //todo
              },
              name: 'Sign Up',
            ),
            const SizedBox(
              height: 15,
            ),
            SignInAndUpRow(
                desc: "Already a member?",
                action: "Login",
                onClick: () {
                  Get.to(() => const LoginScreenView());
                })
          ],
        ),
      ),
    )));
  }
}
