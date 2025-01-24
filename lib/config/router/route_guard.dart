import 'package:my_flutter_template_v2/config/router/routes_name.dart';

class RoutesGuard {
  static final protectedRoutes = [
    // RoutesName.home_screen,
  ];

  static final requiresVerification = [
    ...protectedRoutes,
  ];

  static bool requiresAuth(String? routeName) {
    return protectedRoutes.contains(routeName);
  }

  static bool requiresEmailVerification(String? routeName) {
    return requiresVerification.contains(routeName);
  }
}