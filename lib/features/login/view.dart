import 'package:final_flutter_project/features/login/cubit.dart';
import 'package:final_flutter_project/features/login/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/discount_offer.dart';
import 'package:final_flutter_project/features/widgets/custom_input_field.dart';
import '../widgets/auth_button.dart';
import 'package:final_flutter_project/features/widgets/footer.dart';
import 'package:final_flutter_project/features/register/view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Logged in successfully!"), backgroundColor: Colors.green,)
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${state.errorMessage}"), backgroundColor: Colors.red,)
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
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
                        controller: cubit.emailController,
                      ),
                      CustomInputField(
                        label: "Password",
                        hintText: "Enter your password",
                        isPassword: true,
                        controller: cubit.passwordController,
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
                      AuthButton(name: "Login", onPressedAction: cubit.login,),
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
        },
      ),
    );
  }
}
