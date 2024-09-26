import 'dart:ui';

import 'package:rive/rive.dart';
import 'package:welcome/welcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.light.path),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: WelcomeConstants.sigmaX,
                sigmaY: WelcomeConstants.sigmaY,
              ),
              child: RiveAnimation.asset(
                Assets.rive.birds,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                child: Assets.images.bottomElement.image(fit: BoxFit.cover)),
          ),
          Column(
            children: [
              const SizedBox(height: Dimensions.size_120),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.size_40,
                ),
                child: Assets.images.title.image(),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Assets.images.element.image(fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.size_40),
            child: Column(
              children: [
                const Spacer(),
                WelcomeTextButton(
                    onPressed: () {}, text: WelcomeConstants.login),
                const SizedBox(
                  height: Dimensions.size_20,
                ),
                WelcomeTextButton(
                    onPressed: () {}, text: WelcomeConstants.getStarted),
                const SizedBox(
                  height: Dimensions.size_150,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
