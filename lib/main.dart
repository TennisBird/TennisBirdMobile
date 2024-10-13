import 'package:navigation/navigation.dart';
import 'package:welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
