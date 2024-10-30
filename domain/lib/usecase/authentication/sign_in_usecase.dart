import 'package:core/core.dart';
import 'package:core/utils/typedef.dart';
import 'package:domain/domain.dart';
import 'package:domain/repository/authentication/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignInUsecase extends FutureUseCaseWithParams<AuthUser, SignInParams> {
  final AuthRepository _repository;

  SignInUsecase(AuthRepository authRepository) : _repository = authRepository;

  @override
  ResultFuture<AuthUser> call(params) => _repository.signIn(
      emailOrPassword: params.emailOrPassword, password: params.password);
}

class SignInParams extends Equatable {
  final String emailOrPassword;
  final String password;

  const SignInParams({
    required this.emailOrPassword,
    required this.password,
  });

  const SignInParams.empty()
      : emailOrPassword = '',
        password = '';

  @override
  List<Object> get props => [emailOrPassword, password];
}
