import 'package:final_flutter_project/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(message, style: TextStyle(
              fontFamily: "Arimo",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),),
            SpinKitChasingDots(
            size: 30,
            color: primaryColor,
          )],
        ),
      ),
    );
  }
}
