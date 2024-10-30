import 'package:core/core.dart';
import 'package:core/utils/typedef.dart';
import 'package:domain/repository/authentication/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignUpUsecase extends FutureUseCaseWithParams<void, SignUpParams> {
  final AuthRepository _repository;

  SignUpUsecase(AuthRepository authRepository) : _repository = authRepository;

  @override
  ResultFuture<void> call(params) => _repository.signUp(
      username: params.username,
      email: params.email,
      password: params.password);
}

class SignUpParams extends Equatable {
  final String username;
  final String email;
  final String password;

  const SignUpParams({
    required this.username,
    required this.email,
    required this.password,
  });

  const SignUpParams.empty()
      : this(
          username: '',
          email: '',
          password: '',
        );

  @override
  List<Object> get props => [username, email, password];
}
