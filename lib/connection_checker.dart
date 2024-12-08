import 'package:core/services/connection/connection.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// final GetIt getIt = GetIt.instance;

final InternetConnection connectionChecker = InternetConnection();

final Connection connection = Connection(connection: connectionChecker);

// void setupLocator() {
//   getIt.registerLazySingleton<InternetConnection>(() => InternetConnection());
//   getIt.registerLazySingleton<Connection>(() => Connection(connection: getIt<InternetConnection>()));
// }
