import 'package:data/data.dart';
import 'package:data/datasource/authentication/auth_remote_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/authentication/auth_repository.dart';
import 'package:domain/repository_impl/authentication/auth_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:navigation/navigation.dart';
import 'package:tennis_bird_mobile/connection_checker.dart';
import 'package:welcome/welcome.dart';


void main() async {
  AppLocalization.init();
  runApp(AppLocalization.localWrapper(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) {
            final AuthRemoteDatasource authRemoteDatasource =
                AuthRemoteDatasourceImpl(
              dio: Dio(),
              connection: connection,
              secureStorage: const FlutterSecureStorage(),
            );
            return AuthRepositoryImpl(
                authRemoteDatasource: authRemoteDatasource);
          },
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
