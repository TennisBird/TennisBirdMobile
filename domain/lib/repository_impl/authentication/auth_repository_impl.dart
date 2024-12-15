import 'dart:developer';

import 'package:core/exceptions/failure.dart';
import 'package:core/utils/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:data/datasource/authentication/auth_remote_datasource.dart';
import 'package:domain/entity/authentication/auth_user.dart';
import 'package:domain/repository/authentication/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource authRemoteDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource;
  @override
  Stream<AuthUser> getCurrentUser() async* {
    try {
      final userStream = _authRemoteDatasource.getCurrentUser();
      await for (final user in userStream) {
        yield AuthUser(
            username: user.username,
            password: user.password,
            email: user.email);
      }
    } catch (e) {
      yield* Stream.error(
          ServerFailure(message: e.toString(), statusCode: e.hashCode));
    }
  }

  @override
  ResultFuture<void> logOut() async {
    try {
      await _authRemoteDatasource.logOut();
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(
        ServerFailure(message: e.toString(), statusCode: e.hashCode),
      ));
    }
  }

  @override
  ResultFuture<AuthUser> signIn({
    required String emailOrLogin,
    required String password,
  }) async {
    try {
      final userModel = await _authRemoteDatasource.signIn(
        emailOrLogin: emailOrLogin,
        password: password,
      );
      log(AuthUser(
        username: userModel.username,
        email: userModel.email,
        password: userModel.password,
      ).toString());
      return Right(AuthUser(
        username: userModel.username,
        email: userModel.email,
        password: userModel.password,
      ));
    } catch (e) {
      log(Future.value(Left(
        ServerFailure(message: 'Failed to sign in: $e', statusCode: e.hashCode),
      )).toString());
      return Future.value(Left(
        ServerFailure(message: 'Failed to sign in: $e', statusCode: e.hashCode),
      ));
    }
  }

  @override
  ResultFuture<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await _authRemoteDatasource.signUp(
        username: username,
        email: email,
        password: password,
      );
      log('User signed up successfully: $username');
      return const Right(null);
    } catch (e) {
      log('Failed to sign up: $e');
      return Future.value(Left(
        ServerFailure(message: 'Failed to sign up: $e', statusCode: e.hashCode),
      ));
    }
  }
}
