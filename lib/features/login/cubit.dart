import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_flutter_project/features/login/state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(): super(LoginInitial());

  final firebase_auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      emit(LoginLoading());
      await firebase_auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch(e) {
      emit(LoginFailure(e.message));
      // emit(LoginFailure(e.code));  // TODO: use e.code to generate a more user-friendly message
    } catch(e) {
      emit(LoginFailure(e.toString()));
    }
  }
}