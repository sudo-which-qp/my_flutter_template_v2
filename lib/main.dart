import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template_v2/app/src/app.dart';
import 'package:my_flutter_template_v2/helpers/hive_manager.dart';
import 'package:my_flutter_template_v2/services/service_locator.dart';
import 'package:my_flutter_template_v2/state/cubits/auth_cubit/auth_cubit.dart';
import 'package:my_flutter_template_v2/state/cubits/theme_cubit/theme_cubit.dart';
import 'package:my_flutter_template_v2/utils/contants/api_constant.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaml/yaml.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  // initialize hive
  await HiveManager().init();

  loadApiCredentials();

  // Setup dependency injection
  await setupLocator();


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(prefs),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>(),
        ),
      ],
      child: const App(),
    ),
  );
}

Future<void> loadApiCredentials() async {
  String yamlString = await rootBundle.loadString('api_credentials.yaml');
  Map<dynamic, dynamic> yamlMap = loadYaml(yamlString);
  Map<String, dynamic> credentialsMap = Map<String, dynamic>.from(yamlMap);
  ApiConstants.apiUrl = credentialsMap['api_url'];
}