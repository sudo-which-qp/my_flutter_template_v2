
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