import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bible_emi_app/config/router/navigates_to.dart';
import 'package:bible_emi_app/config/router/routes_name.dart';
import 'package:bible_emi_app/services/service_locator.dart';
import 'package:bible_emi_app/state/cubits/auth_cubit/auth_cubit.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final authCubit = getIt<AuthCubit>();

    if (authCubit.state is AuthAuthenticated) {
      Timer(
        Duration(seconds: 3),
            () => navigateEndTo(
          context,
          destination: RoutesName.home_screen,
        ),
      );
    } else {
      Timer(
        Duration(seconds: 3),
            () => navigateEndTo(
          context,
          destination: RoutesName.login_screen,
        ),
      );
    }
  }
}