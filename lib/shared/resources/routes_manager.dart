import 'package:flutter/material.dart';

import '../../auth/presentation/screens/login/login_view.dart';
import '../../home/presentation/screens/home/home_view.dart';
import '../local/shared_preference.dart';
import 'app_strings.dart';
import 'constants_manager.dart';

class Routes {
  static const String home = "/";
  static const String loginRoute = "/loginRoute";
  static const String homeScreenRoute = "/homeScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) =>
        CacheHelper.getData(key: AppConstants.token) == null
            ? const LoginView() : const HomeView() );
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
        case Routes.homeScreenRoute:
      return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.wrongScreen),
            ),
            body: const Center(child: Text(AppStrings.routeNotFound)),
          ),
    );
  }
}
