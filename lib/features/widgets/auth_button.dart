import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.name,
    required this.onPressedAction,
  });

  final String name;
  final onPressedAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () { onPressedAction(); },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            )
        ),
        child: Text(name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),));
  }
}