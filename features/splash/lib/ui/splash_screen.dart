import 'dart:ui';

import 'package:navigation/configs/route_util.dart';
import 'package:navigation/navigation.dart';
import 'package:rive/rive.dart';
import 'package:splash/splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      AppRouter.router.go(PAGES.welcome.screenPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.background.path),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: SplashConstants.sigmaX,
                sigmaY: SplashConstants.sigmaY,
              ),
              child: RiveAnimation.asset(
                Assets.rive.birds,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: RiveAnimation.asset(Assets.rive.logo),
          )
        ],
      ),
    );
  }
}
