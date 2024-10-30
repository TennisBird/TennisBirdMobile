import 'package:core/utils/typedef.dart';
import 'package:domain/domain.dart';

abstract class AuthRepository {
  const AuthRepository();

  Stream<AuthUser> getCurrentUser();

  ResultFuture<AuthUser> signIn({
    required String emailOrPassword,
    required String password,
  });

  ResultFuture<void> signUp({
    required String username,
    required String email,
    required String password,
  });

  ResultFuture<void> logOut();
}