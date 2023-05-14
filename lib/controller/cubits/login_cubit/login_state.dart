part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String successMessage;
  LoginSuccess({required this.successMessage});
}

class LoginFailure extends LoginState {
  final String failureMessage;

  LoginFailure({required this.failureMessage});
}
