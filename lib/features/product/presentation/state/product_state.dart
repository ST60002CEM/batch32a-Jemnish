class ProductState {
  final bool isLoading;
  final String? error;
  final String? imageName;

  ProductState({
    required this.isLoading,
    this.error,
    this.imageName,
  });

  factory ProductState.initial() {
    return ProductState(
      isLoading: false,
      error: null,
      imageName: null,
    );
  }

  ProductState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }

  @override
  String toString() => 'ProductState(isLoading: $isLoading, error: $error)';
}