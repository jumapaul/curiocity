import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextInputType? inputType;
  final TextEditingController editingController;

  const InputTextFieldWidget(
      {super.key, required this.hintText, required this.editingController, this.labelText, this.inputType});

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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1)),
        hintText: widget.hintText,
        labelText: widget.labelText
      ),
    );
  }
}

class PasswordTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController passwordTextEditController;

  const PasswordTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.passwordTextEditController, required this.labelText});

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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon: IconButton(
              onPressed: () {
                _toggleVisibility();
              },
              icon: showPassword
                  ? const Icon(
                      size: 15,
                      Icons.visibility,
                      color: Colors.black,
                    )
                  : const Icon(
                      size: 15,
                      Icons.visibility_off,
                      color: Colors.black,
                    ))),
    );
  }
}
