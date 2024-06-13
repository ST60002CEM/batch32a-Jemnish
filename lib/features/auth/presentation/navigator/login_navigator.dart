import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/navigator/navigator.dart';
import 'package:kheti_pati/features/auth/presentation/navigator/register_navigator.dart';
import 'package:kheti_pati/features/auth/presentation/view/login_view.dart';

import 'package:kheti_pati/features/home/presentation/navigator/home_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

// This class will be used to call register view
class LoginViewNavigator
    with RegisterViewRoute, HomeViewRoute{}

// Anyone who want to call login page
mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
}
