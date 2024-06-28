import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/features/product/domain/usecases/product_usecase.dart';
import 'package:kheti_pati/features/product/presentation/navigator/product_navigator.dart';
import 'package:kheti_pati/features/product/presentation/state/product_state.dart';

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, ProductState>((ref) {
  final navigator = ref.read(productViewNavigatorProvider);
  return ProductViewModel(ref.read(productUseCaseProvider), navigator);
});

class ProductViewModel extends StateNotifier<ProductState> {
  ProductViewModel(this._productUseCase, this.navigator)
      : super(ProductState.initial());

  final ProductUseCase _productUseCase;
  final ProductViewNavigator navigator;

  Future resetState() async {
    state = ProductState.initial();
    getAllProducts();
  }

  void getAllProducts() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final products = currentState.products;
    final hasReachedMax = currentState.hasMaxReached;

    if (!hasReachedMax) {
      // get data from data source
      final result = await _productUseCase.getAllProducts(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasMaxReached: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasMaxReached: true);
          } else {
            state = state.copyWith(
              products: [...products, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
    if (hasReachedMax) {
      state = state.copyWith(isLoading: false);
    }
  }
}
