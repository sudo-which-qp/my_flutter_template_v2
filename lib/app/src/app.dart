import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bible_emi_app/config/router/routes.dart';
import 'package:bible_emi_app/config/router/routes_name.dart';
import 'package:bible_emi_app/state/cubits/theme_cubit/theme_cubit.dart';
import 'package:bible_emi_app/utils/themes/custom_theme.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeCubit>().state.isDarkTheme == false
              ? buildLightTheme()
              : buildDarkTheme(),
          title: 'VNotes',
          builder: FlashyFlushbarProvider.init(),
          initialRoute: RoutesName.counter_screen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
