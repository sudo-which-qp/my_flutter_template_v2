import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template_v2/config/router/routes.dart';
import 'package:my_flutter_template_v2/config/router/routes_name.dart';
import 'package:my_flutter_template_v2/state/cubits/theme_cubit/theme_cubit.dart';
import 'package:my_flutter_template_v2/utils/themes/custom_theme.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.isDarkTheme;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark == false
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
