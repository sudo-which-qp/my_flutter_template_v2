import 'package:get_it/get_it.dart';
import 'package:my_flutter_template_v2/data/network/network_services_api.dart';
import 'package:my_flutter_template_v2/data/repositories/auth_repository.dart';
import 'package:my_flutter_template_v2/helpers/hive_manager.dart';
import 'package:my_flutter_template_v2/state/cubits/auth_cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Services
  getIt.registerLazySingleton<NetworkServicesApi>(() => NetworkServicesApi());
  getIt.registerLazySingleton<HiveManager>(() => HiveManager());

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepository(
      api: getIt<NetworkServicesApi>(),
      hiveManager: getIt<HiveManager>(),
    ),
  );

  // Cubits
  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(
      authRepository: getIt<AuthRepository>(),
    ),
  );
}