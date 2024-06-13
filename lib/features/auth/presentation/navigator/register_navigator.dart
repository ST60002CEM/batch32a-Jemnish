import 'package:kheti_pati/app/navigator/navigator.dart';
import 'package:kheti_pati/features/auth/presentation/view/register_view.dart';

// This class will call any view I call
class RegisterViewNavigator {}

// Anyone who want to call register view
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}
