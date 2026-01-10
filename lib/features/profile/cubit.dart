import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_flutter_project/features/profile/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(): super(ProfileInitial());

  final firebase_auth = FirebaseAuth.instance;

  void logout () async {
    try {
      emit(LogoutLoading());
      await firebase_auth.signOut();
      emit(LogoutSuccess());
    } on FirebaseAuthException catch(e) {
      emit(LogoutFailure(e.message));
    } catch(e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}