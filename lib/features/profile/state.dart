abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class LogoutLoading extends ProfileState {}
class LogoutSuccess extends ProfileState {}
class LogoutFailure extends ProfileState {
  final errorMessage;
  LogoutFailure(this.errorMessage);
}
