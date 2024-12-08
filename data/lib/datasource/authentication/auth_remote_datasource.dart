import 'package:data/models/user/user_model.dart';

abstract class AuthRemoteDatasource {
  const AuthRemoteDatasource();

  Stream<UserModel> getCurrentUser();

  Future<UserModel> signIn({
    required String emailOrLogin,
    required String password,
  });

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<void> logOut();
}