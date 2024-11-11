import 'package:core/core.dart';
import 'package:data/models/user/user_model.dart';
import 'package:dio/dio.dart';

import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio _dio;
  final Connection _connection;
  String? _accessToken;

  AuthRemoteDatasourceImpl({required Dio dio, required Connection connection})
      : _dio = dio,
        _connection = connection;

  @override
  Stream<UserModel> getCurrentUser() async* {
    if (_accessToken == null) {
      throw Exception('Not authenticated');
    }

    final response = await _dio.get('path');
    if (response.statusCode == 200) {
      yield UserModel.fromJson(response.data['user']);
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<void> logOut() async {
    _accessToken = null;
    _dio.options.headers.remove('Authorization');
  }

  @override
  Future<UserModel> signIn(
      {required String emailOrPassword, required String password}) async {
    if (!await _connection.hasConnection()) {
      throw Exception('No internet');
    }

    final response = await _dio.post(
      'path',
      data: {'emailOrPassword': emailOrPassword, 'password': password},
    );
    if (response.statusCode == 200) {
      _accessToken = response.data['accessToken'];
      _dio.options.headers['Authorization'] = 'Bearer $_accessToken';
      return UserModel.fromJson(response.data['user']);
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<void> signUp(
      {required String username,
      required String email,
      required String password}) async {
    if (!await _connection.hasConnection()) {
      throw Exception('No internet connection');
    }
    final response = await _dio.post(
      'url',
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to sign up');
    }
  }
}
