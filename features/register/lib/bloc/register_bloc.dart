import 'dart:developer';

import 'package:core/core.dart';
import 'package:domain/repository/authentication/auth_repository.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(const RegisterState()) {
    on<RegisterUsernameChanged>((event, emit) {
      log('Username changed: ${event.username}');
      emit(state.copyWith(
        username: event.username,
        isFormValid: _isFormValid(
          event.username,
          state.email,
          state.password,
          state.confirmPassword,
        ),
      ));
    });

    on<RegisterEmailChanged>((event, emit) {
      log('Email changed: ${event.email}');
      emit(state.copyWith(
        email: event.email,
        isFormValid: _isFormValid(
          state.username,
          event.email,
          state.password,
          state.confirmPassword,
        ),
      ));
    });

    on<RegisterPasswordChanged>((event, emit) {
      log('Password changed');
      emit(state.copyWith(
        password: event.password,
        isFormValid: _isFormValid(
          state.username,
          state.email,
          event.password,
          state.confirmPassword,
        ),
      ));
    });

    on<RegisterConfirmPasswordChanged>((event, emit) {
      log('Confirm Password changed');
      emit(state.copyWith(
        confirmPassword: event.confirmPassword,
        isFormValid: _isFormValid(
          state.username,
          state.email,
          state.password,
          event.confirmPassword,
        ),
      ));
    });

    on<RegisterSubmitted>((event, emit) async {
      log('RegisterSubmitted event triggered');
      if (state.isFormValid) {
        log('Form is valid. Submitting...');
        emit(state.copyWith(
            isSubmitting: true, isError: false, isSuccess: false));
        try {
          await authRepository.signUp(
            username: state.username,
            email: state.email,
            password: state.password,
          );
          log('Registration successful for username: ${state.username}');
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } catch (e) {
          log('Registration failed: $e');
          emit(state.copyWith(isSubmitting: false, isError: true));
        }
      } else {
        log('Form is invalid. Submission aborted.');
      }
    });
  }

  bool _isFormValid(
      String username, String email, String password, String confirmPassword) {
    log('Checking form validation: username=$username, email=$email, password=$password, confirmPassword=$confirmPassword');
    return username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;
  }
}
