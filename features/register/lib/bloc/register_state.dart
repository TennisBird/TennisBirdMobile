part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isFormValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isError;

  const RegisterState(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.isFormValid = false,
      this.isSubmitting = false,
      this.isSuccess = false,
      this.isError = false});

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isFormValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isError,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isFormValid: isFormValid ?? this.isFormValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        confirmPassword,
        isFormValid,
        isSubmitting,
        isSuccess,
        isError
      ];
}
