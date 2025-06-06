import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter_template_v2/config/router/navigates_to.dart';
import 'package:my_flutter_template_v2/config/router/routes_name.dart';
import 'package:my_flutter_template_v2/services/service_locator.dart';
import 'package:my_flutter_template_v2/state/cubits/auth_cubit/auth_cubit.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final authCubit = getIt<AuthCubit>();

    if (authCubit.state is AuthAuthenticated) {
      Timer(
        Duration(seconds: 3),
            () => navigateEndTo(
          context,
          destination: RoutesName.homeScreen,
        ),
      );
    } else {
      Timer(
        Duration(seconds: 3),
            () => navigateEndTo(
          context,
          destination: RoutesName.loginScreen,
        ),
      );
    }
  }
}