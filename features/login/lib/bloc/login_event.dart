part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginRequested extends LoginEvent {
  final String emailOrLogin;
  final String password;

  LoginRequested({
    required this.emailOrLogin,
    required this.password,
  });
}