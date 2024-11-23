import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final String? errorText;
  final TextInputType? inputType;
  final TextEditingController editingController;

  const InputTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.editingController,
      this.labelText,
      this.inputType,
      this.errorText});

  @override
  State<InputTextFieldWidget> createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      controller: widget.editingController,
      decoration: InputDecoration(
        errorText: widget.errorText,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: TextStyle(
            fontSize: 14, color: Get.theme.colorScheme.inverseSurface),
        labelStyle: TextStyle(
            fontSize: 14, color: Get.theme.colorScheme.inverseSurface),
      ),
      maxLines: 4,
      minLines: 1,
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}

class PasswordTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? errorText;
  final TextEditingController passwordTextEditController;

  const PasswordTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.passwordTextEditController,
      required this.labelText,
      this.errorText});

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool showPassword = false;

  void _toggleVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !showPassword,
      controller: widget.passwordTextEditController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorText: widget.errorText,
        hintStyle: const TextStyle(fontSize: 14),
        labelStyle: TextStyle(
            fontSize: 14, color: Theme.of(context).colorScheme.inverseSurface),
        suffixIcon: IconButton(
          onPressed: () {
            _toggleVisibility();
          },
          icon: showPassword
              ? const Icon(
                  size: 15,
                  Icons.visibility,
                )
              : const Icon(
                  size: 15,
                  Icons.visibility_off,
                ),
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
