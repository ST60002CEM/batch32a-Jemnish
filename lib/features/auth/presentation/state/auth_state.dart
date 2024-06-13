class AuthState {
  final bool isLoading;

  final String? error;

  AuthState({
    required this.isLoading,
    this.error,
  });

  factory AuthState.initial() => AuthState(
        isLoading: false,
        error: null,
      );

  AuthState copyWith({
    bool? isLoading,
    bool? obscurePassword,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
