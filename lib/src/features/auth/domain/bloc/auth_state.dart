enum AuthStatus { initial, loading, loaded, error }

class AuthState {
  final AuthStatus state;
  final String? message;

  AuthState({required this.state, this.message});
}
