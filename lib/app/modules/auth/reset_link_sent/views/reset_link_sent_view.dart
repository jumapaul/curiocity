import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_link_sent_controller.dart';

class ResetLinkSentView extends GetView<ResetLinkSentController> {
  const ResetLinkSentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetLinkSentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetLinkSentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
