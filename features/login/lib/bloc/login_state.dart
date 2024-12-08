part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {
  final String username;

  LoginSuccess({required this.username});
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}