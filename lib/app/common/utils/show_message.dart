import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

enum MessageType { Error, Success }

void showMessage(String message, MessageType type) {
  if (type == MessageType.Success) {
    toastification.show(
      context: Get.context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      animationDuration: const Duration(milliseconds: 300),
      type: ToastificationType.success,
      alignment: Alignment.bottomCenter,
      showIcon: true,
      style: ToastificationStyle.flatColored,
    );
  } else {
    toastification.show(
      context: Get.context,
      title: Text(message),
      animationDuration: const Duration(milliseconds: 300),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.error,
      alignment: Alignment.bottomCenter,
      showIcon: true,
      style: ToastificationStyle.flatColored,
    );
  }
}
