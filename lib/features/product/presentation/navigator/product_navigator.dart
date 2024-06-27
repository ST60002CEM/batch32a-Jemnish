import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/navigator/navigator.dart';
import 'package:kheti_pati/features/auth/presentation/navigator/register_navigator.dart';
import 'package:kheti_pati/features/home/presentation/navigator/home_navigator.dart';
import 'package:kheti_pati/features/home/presentation/view/bottom_view/product_view.dart';

final productViewNavigatorProvider = Provider((ref) => ProductViewNavigator());

// This class will be used to call register view
class ProductViewNavigator{}

// Anyone who want to call product page
mixin ProductViewRoute {
  openProductView() {
    NavigateRoute.popAndPushRoute(const ProductView());
  }
}
