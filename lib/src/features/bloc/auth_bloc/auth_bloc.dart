import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/src/features/bloc/auth_bloc/auth_event.dart';
import 'package:social_network/src/features/bloc/auth_bloc/auth_state.dart';

import '../../../validation/auth_validation.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthValidator _validator = AuthValidator();

  AuthBloc() : super(AuthState(state: AuthStatus.initial)) {
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthState(state: AuthStatus.loading));
    final emailError = _validator.validateEmail(event.email);
    if (emailError != null) {
      emit(AuthState(state: AuthStatus.error, message: emailError));
      return;
    }
    if (event.password.isEmpty) {
      emit(AuthState(
          state: AuthStatus.error, message: 'Password cannot be empty'));
      return;
    }
    emit(AuthState(state: AuthStatus.loaded));
  }

  Future<void> _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(AuthState(state: AuthStatus.loading));
    final emailError = _validator.validateEmail(event.email);
    if (emailError != null) {
      emit(AuthState(state: AuthStatus.error, message: emailError));
      return;
    }
    final passwordError = _validator.validatePassword(event.password);
    if (passwordError != null) {
      emit(AuthState(state: AuthStatus.error, message: passwordError));
      return;
    }
    final confirmPasswordError =
        _validator.validateConfirmPassword(event.password, event.password);
    if (confirmPasswordError != null) {
      emit(AuthState(state: AuthStatus.error, message: confirmPasswordError));
      return;
    }
    emit(AuthState(state: AuthStatus.loaded));
  }
}
