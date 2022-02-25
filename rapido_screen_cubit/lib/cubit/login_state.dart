part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}

class LoginProcessing extends LoginState {}

class LoginSuccess extends LoginState {

  final LoginResponse loginResponse;

  LoginSuccess({required this.loginResponse});

}