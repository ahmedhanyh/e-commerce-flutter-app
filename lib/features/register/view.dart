import 'package:final_flutter_project/features/register/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_flutter_project/features/register/cubit.dart';
import '../widgets/loading_screen.dart';
import '../widgets/discount_offer.dart';
import 'package:final_flutter_project/features/widgets/custom_input_field.dart';
import '../widgets/auth_button.dart';
import 'package:final_flutter_project/features/widgets/footer.dart';
import 'package:final_flutter_project/features/login/view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Registration successful!"), backgroundColor: Colors.green,)
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${state.errorMessage}"), backgroundColor: Colors.red,)
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          if (state is RegisterLoading) {
            return LoadingScreen(message: "Registering new user...");
          } return Scaffold(
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
                        label: "Email",
                        hintText: "Enter your email (e.g. user@gmail.com)",
                        controller: cubit.emailController,
                      ),
                      CustomInputField(
                        label: "Password",
                        hintText: "Enter your password",
                        isPassword: true,
                        controller: cubit.passwordController,
                      ),
                      CustomInputField(
                        label: "Confirm Password",
                        hintText: "Re-enter your password",
                        isPassword: true,
                        controller: cubit.passwordConfirmationController,
                      ),
                      AuthButton(
                        name: "Create account",
                        onPressedAction: cubit.register,
                      ),
                      Footer(
                        firstPart: "Already have an account? ",
                        secondPart: "Login",
                        destination: LoginScreen(),
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
