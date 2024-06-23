import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/navigator/navigator.dart';
import 'package:kheti_pati/features/auth/presentation/view/forgot_password_view.dart';

final forgotPasswordNavigatorProvider =
    Provider((ref) => ForgotPasswordNavigator());

// This class will be used to call register view
class ForgotPasswordNavigator {}

// Anyone who want to call login page
mixin ForgotPasswordRoute {
  openForgotPasswordView() {
    NavigateRoute.pushRoute(const ForgotPasswordView());
  }
}
