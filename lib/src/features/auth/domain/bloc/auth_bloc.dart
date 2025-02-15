import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthState(state: AuthStatus.initial)) {
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    try {
      emit(AuthState(state: AuthStatus.loading));
      emit(AuthState(state: AuthStatus.loaded));
    } catch (e) {
      emit(AuthState(state: AuthStatus.error, message: e.toString()));
    }
  }


  Future<void> _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(AuthState(state: AuthStatus.loading));
    try {
      emit(AuthState(state: AuthStatus.loading));
      emit(AuthState(state: AuthStatus.loaded));
    } catch (e) {
      emit(AuthState(state: AuthStatus.error, message: e.toString()));
    }
  }
}
