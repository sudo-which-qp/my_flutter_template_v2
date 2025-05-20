import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bible_emi_app/config/router/route_guard.dart';
import 'package:bible_emi_app/config/router/routes_name.dart';
import 'package:bible_emi_app/presentation/views.dart';
import 'package:bible_emi_app/services/service_locator.dart';
import 'package:bible_emi_app/state/cubits/auth_cubit/auth_cubit.dart';
import 'package:bible_emi_app/state/cubits/counter_cubit/counter_cubit.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final authCubit = getIt<AuthCubit>();
    final state = authCubit.state;
    final args = settings.arguments as Map<String, dynamic>?;

    // if (RoutesGuard.requiresAuth(settings.name)) {
    //   if (state is AuthEmailUnverified) {
    //     return MaterialPageRoute(
    //       builder: (_) => const VerifyCode(from: 'protected_route'),
    //       maintainState: true, // Preserve route state
    //     );
    //   }
    //
    //   if (state is! AuthAuthenticated) {
    //     authCubit.saveAttemptedRoute(settings.name!);
    //     return MaterialPageRoute(
    //       builder: (_) => const LoginScreen(),
    //       maintainState: true,
    //     );
    //   }
    // }

    switch (settings.name) {
      case RoutesName.counter_screen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider<CounterCubit>(
              create: (context) => CounterCubit(),
              child: CounterScreen(),
            ));

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'No Routes Generated',
                ),
              ),
            );
          },
        );
    }
  }
}