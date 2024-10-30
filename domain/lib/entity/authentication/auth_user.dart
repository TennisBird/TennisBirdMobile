import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String username;
  final String password;
  final String email;

  const AuthUser(
      {required this.username, required this.password, required this.email});

  @override
  List<Object?> get props => [username, password, email];
}
