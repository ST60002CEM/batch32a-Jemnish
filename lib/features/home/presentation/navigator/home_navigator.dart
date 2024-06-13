import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/navigator/navigator.dart';
import 'package:kheti_pati/features/auth/presentation/navigator/login_navigator.dart';
import 'package:kheti_pati/features/home/presentation/view/home_view.dart';

final homeViewNavigatorProvider = Provider<HomeViewNavigator>((ref) {
  return HomeViewNavigator();
});

class HomeViewNavigator with LoginViewRoute {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.popAndPushRoute(const HomeView());
  }
}