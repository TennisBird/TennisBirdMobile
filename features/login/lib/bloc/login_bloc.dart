import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domain/repository/authentication/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  
  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginInProgress());

    final result = await _authRepository.signIn(
      emailOrLogin: event.emailOrLogin,
      password: event.password,
    );

    result.fold(
      (failure) {
        log(result.toString());
        emit(LoginFailure(errorMessage: failure.message));
      },
      (authUser) {
        log(result.toString());
        emit(LoginSuccess(username: authUser.username));
      },
    );
  }
}
