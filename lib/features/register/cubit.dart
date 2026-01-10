import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_flutter_project/features/register/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(): super(RegisterInitial());
}