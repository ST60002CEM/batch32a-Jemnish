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
  ProductViewModel() : super(ProductState.initial());
}
