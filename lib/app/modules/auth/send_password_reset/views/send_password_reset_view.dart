import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/send_password_reset_controller.dart';

class SendPasswordResetView extends GetView<SendPasswordResetController> {
  const SendPasswordResetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SendPasswordResetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SendPasswordResetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
