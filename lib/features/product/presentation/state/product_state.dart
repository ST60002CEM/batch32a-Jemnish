import 'package:kheti_pati/features/product/domain/entity/product_entity.dart';

class ProductState {
  final List<ProductEntity> products;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  ProductState({
    required this.products,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
  });

  factory ProductState.initial() {
    return ProductState(
      products: [],
      isLoading: false,
      hasMaxReached: false,
      page: 0,
    );
  }

  ProductState copyWith({
    String? error,
    int? page,
    bool? isLoading,
    List<ProductEntity>? products,
    bool? hasMaxReached,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      hasMaxReached: hasMaxReached ?? this.hasMaxReached,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProductState { products: ${products.length}, isLoading: $isLoading, hasMaxReached: $hasMaxReached, page: $page }';
}
