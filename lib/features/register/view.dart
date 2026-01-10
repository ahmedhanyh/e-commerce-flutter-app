import 'package:flutter/material.dart';
import '../widgets/discount_offer.dart';
import 'package:final_flutter_project/features/widgets/custom_input_field.dart';
import '../widgets/auth_button.dart';
import 'package:final_flutter_project/features/widgets/footer.dart';
import 'package:final_flutter_project/features/login/view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 20,
                children: [
                  DiscountOffer(),
                  CustomInputField(label: "Email", hintText: "user@gmail.com"),
                  CustomInputField(label: "Password", hintText: "Enter your password", isPassword: true,),
                  CustomInputField(label: "Confirm Password", hintText: "Re-enter your password", isPassword: true,),
                  AuthButton(name: "Create account",),
                  Footer(firstPart: "Already have an account? ", secondPart: "Login", destination: LoginScreen(),)
                ],
              ),
            ),
          )
      ),
    );
  }
}