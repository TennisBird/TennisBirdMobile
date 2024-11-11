import 'package:core/core.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterUsernameChanged>((event, emit) {
      emit(state.copyWith(
          username: event.username,
          isFormValid: _isFormValid(
            event.username,
            state.email,
            state.password,
            state.confirmPassword,
          )));
    });
    on<RegisterEmailChanged>((event, emit) {
      emit(state.copyWith(
          email: event.email,
          isFormValid: _isFormValid(
            state.username,
            event.email,
            state.password,
            state.confirmPassword,
          )));
    });
    on<RegisterPasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: event.password,
          isFormValid: _isFormValid(
            state.username,
            state.email,
            event.password,
            state.confirmPassword,
          )));
    });
    on<RegisterConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
          confirmPassword: event.confirmPassword,
          isFormValid: _isFormValid(
            state.username,
            state.email,
            state.password,
            event.confirmPassword,
          )));
    });
    on<RegisterSubmitted>((event, emit) async {
      if (state.isFormValid) {
        emit(state.copyWith(
            isSubmitting: true, isError: false, isSuccess: false));
        try {
          //TODO: Success reg
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } catch (_) {
          //TODO: Failure reg
          emit(state.copyWith(isSubmitting: false, isError: true));
        }
      }
    });
  }

  bool _isFormValid(
      String username, String email, String password, String confirmPassword) {
    return username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;
  }
}
