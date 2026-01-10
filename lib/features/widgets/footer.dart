import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/// Used in LoginScreen and RegisterScreen
class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.firstPart,
    required this.secondPart,
    required this.destination,
  });

  final String firstPart;
  final String secondPart;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: firstPart,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Colors.black54,
        ),
        children: [
          TextSpan(
            text: secondPart,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              decoration: TextDecoration.underline,

            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return destination;
              }));
            },
          ),
        ],
      ),
    );
  }
}
