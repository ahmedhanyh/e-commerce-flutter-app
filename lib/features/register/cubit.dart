import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_flutter_project/features/register/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(): super(RegisterInitial());

  final firebase_auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  void register() async {
    try {
      emit(RegisterLoading());
      await firebase_auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      if (emailController.text.isEmpty
       || passwordController.text.isEmpty
       || passwordConfirmationController.text.isEmpty) {
        emit(RegisterFailure("One or more fields are empty"));
      } else if (passwordController.text == passwordConfirmationController.text) {
        emit(RegisterFailure("Passwords don't match"));
      }
      emit(RegisterSuccess());
    } on FirebaseAuthException catch(e) {
      emit(RegisterFailure(e.message));
    } catch(e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}