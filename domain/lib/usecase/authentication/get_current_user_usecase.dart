import 'package:domain/domain.dart';
import 'package:domain/repository/authentication/auth_repository.dart';

final class GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUserUsecase({required this.authRepository});

  Stream<AuthUser> call() => authRepository.getCurrentUser();
}
