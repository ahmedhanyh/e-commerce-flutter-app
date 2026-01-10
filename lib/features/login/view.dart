import 'package:flutter/material.dart';
import '../widgets/discount_offer.dart';
import 'package:final_flutter_project/features/widgets/custom_input_field.dart';
import '../widgets/auth_button.dart';
import 'package:final_flutter_project/features/widgets/footer.dart';
import 'package:final_flutter_project/features/register/view.dart';

// temporary controllers so that registeration is functional for now
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                CustomInputField(
                  label: "Username",
                  hintText: "Enter your username",
                  controller: usernameController,
                ),
                CustomInputField(
                  label: "Password",
                  hintText: "Enter your password",
                  isPassword: true,
                  controller: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (bool? newValue) {}),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Forget password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                // AuthButton(name: "Login",),
                Footer(
                  firstPart: "Don't have an account? ",
                  secondPart: "Sign up",
                  destination: RegisterScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
