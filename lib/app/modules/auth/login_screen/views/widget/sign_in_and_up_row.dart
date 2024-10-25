import 'package:flutter/material.dart';

class SignInAndUpRow extends StatelessWidget {
  final String desc;
  final String action;
  final VoidCallback onClick;

  const SignInAndUpRow(
      {super.key,
      required this.desc,
      required this.action,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(desc),
        TextButton(
            onPressed: onClick,
            child: Text(
              action,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue),
            ))
      ],
    );
  }
}
