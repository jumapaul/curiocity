import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/sign_in_and_up_row.dart';
import 'package:curiocity/app/modules/auth/sign_up_screen/views/sign_up_screen_view.dart';
import 'package:curiocity/app/modules/auth/verify_email_screen/views/verify_email_screen_view.dart';
import 'package:curiocity/app/modules/common_widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginScreenController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset("assets/images/login_vector.svg"),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/curio.png"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextFieldWidget(
                hintText: 'Email Address',
                editingController: controller.emailAddressController,
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextFieldWidget(
                hintText: "Password",
                passwordTextEditController: controller.passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButtonWidget(
                  onClick: () {
                    Get.to(() => const VerifyEmailScreenView());
                  },
                  name: "Continue"),
              const SizedBox(
                height: 15,
              ),
              SignInAndUpRow(
                desc: 'Not a member?',
                action: "Sign Up",
                onClick: () {
                  Get.to(() => const SignUpScreenView());
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
