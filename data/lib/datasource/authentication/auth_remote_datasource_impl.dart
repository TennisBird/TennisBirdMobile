import 'dart:developer';

import 'package:core/core.dart';
import 'package:data/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio _dio;
  final Connection _connection;
  final FlutterSecureStorage _secureStorage;

  AuthRemoteDatasourceImpl({
    required Dio dio,
    required Connection connection,
    required FlutterSecureStorage secureStorage,
  })  : _dio = dio,
        _connection = connection,
        _secureStorage = secureStorage;

  @override
  Stream<UserModel> getCurrentUser() async* {
    try {
      final token = await _secureStorage.read(key: 'accessToken');
      if (token == null) {
        throw Exception('Not authenticated');
      }

      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get('path');
      if (response.statusCode == 200) {
        yield UserModel.fromJson(response.data['user']);
      } else {
        throw Exception('Failed to fetch current user');
      }
    } catch (e) {
      throw Exception('Error fetching current user: ${e.toString()}');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _secureStorage.delete(key: 'accessToken');

      _dio.options.headers.remove('Authorization');
    } catch (e) {
      throw Exception('Error logging out: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signIn({
    required String emailOrLogin,
    required String password,
  }) async {
    try {
      if (!await _connection.hasConnection()) {
        throw Exception('No internet');
      }

      final response = await _dio.post(
        'http://10.0.2.2:8080/api/auth/login',
        data: {
          "login": emailOrLogin,
          "password": password
        },
      );
      if (response.statusCode == 200) {
        log(response.toString());
        final accessToken = response.data['token'];
        await _secureStorage.write(key: 'accessToken', value: accessToken);
        _dio.options.headers['Authorization'] = 'Bearer $accessToken';

        return UserModel.fromJson(response.data['user']);
      } else {
        throw Exception('Failed to sign in');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw Exception('Error during sign-in: ${e.toString()}');
    }
  }

  @override
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      if (!await _connection.hasConnection()) {
        throw Exception('No internet connection');
      }

      final response = await _dio.post(
        'url',
        data: {
          "login": username,
          "password": password,
          "first_name": "a",
          "last_name": "a",
          "username": "a",
          "birth_date": "1990-01-01",
          "mail_address": email,
          "telephone_number": "a"
        },
      );

      if (response.statusCode == 201) {
        final accessToken = response.data['token'];
        await _secureStorage.write(key: 'accessToken', value: accessToken);
        _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      throw Exception('Error during sign-up: ${e.toString()}');
    }
  }
}
