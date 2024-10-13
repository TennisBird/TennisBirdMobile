import 'package:go_router/go_router.dart';
import 'package:home/ui/pages/home_page.dart';
import 'package:login/login.dart';
import 'package:navigation/configs/route_util.dart';
import 'package:navigation/constants/transitions/fade_in.dart';
import 'package:navigation/constants/transitions/slide_up.dart';
import 'package:register/register.dart';
import 'package:splash/splash.dart';
import 'package:welcome/ui/pages/welcome_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: PAGES.splash.screenPath,
        name: PAGES.splash.screenName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: PAGES.welcome.screenPath,
        name: PAGES.welcome.screenName,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const WelcomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: FadeIn(animation: animation, child: child),
            );
          },
        ),
      ),
      GoRoute(
        path: PAGES.login.screenPath,
        name: PAGES.login.screenName,
        pageBuilder: (context, state) {
          return SlideUpTransitionPage(
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: PAGES.register.screenPath,
        name: PAGES.register.screenName,
        pageBuilder: (context, state) {
          return SlideUpTransitionPage(
            child: const RegisterPage(),
          );
        },
      ),
      GoRoute(
        path: PAGES.home.screenPath,
        name: PAGES.home.screenName,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: FadeIn(animation: animation, child: child),
            );
          },
        ),
      ),
    ],
  );
}
