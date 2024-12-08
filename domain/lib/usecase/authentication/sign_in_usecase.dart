import 'package:core/core.dart';
import 'package:core/utils/typedef.dart';
import 'package:domain/domain.dart';
import 'package:domain/repository/authentication/auth_repository.dart';

class SignInUsecase extends FutureUseCaseWithParams<AuthUser, SignInParams> {
  final AuthRepository _repository;

  SignInUsecase(AuthRepository authRepository) : _repository = authRepository;

  @override
  ResultFuture<AuthUser> call(params) => _repository.signIn(
      emailOrLogin: params.emailOrLogin, password: params.password);
}

class SignInParams extends Equatable {
  final String emailOrLogin;
  final String password;

  const SignInParams({
    required this.emailOrLogin,
    required this.password,
  });

  const SignInParams.empty()
      : emailOrLogin = '',
        password = '';

  @override
  List<Object> get props => [emailOrLogin, password];
}
