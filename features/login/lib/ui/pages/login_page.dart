import 'package:core_ui/common/components/text_button.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:login/constants/login_text.dart';
import 'package:login/ui/components/transparent_text_field.dart';
import 'package:login/util/assets.gen.dart' as login_assets;
import 'package:navigation/configs/route_util.dart';
import 'package:navigation/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.8,
          child: Container(
            padding: const EdgeInsets.all(Dimensions.size_16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.grad1Color, AppColors.grad2Color]),
              borderRadius: BorderRadius.circular(Dimensions.size_20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimensions.size_10),
              child: Column(
                children: [
                  const SizedBox(
                    height: Dimensions.size_30,
                  ),
                  const GradientText(LoginText.login,
                      style: MainText.logText,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.text1GradColor,
                            AppColors.text2GradColor
                          ])),
                  const SizedBox(
                    height: Dimensions.size_30,
                  ),
                  TransparentTextField(
                    hintText: LoginText.username_or_email,
                    icon: login_assets.Assets.images.svg.user,
                  ),
                  const SizedBox(
                    height: Dimensions.size_20,
                  ),
                  TransparentTextField(
                    hintText: LoginText.password,
                    icon: login_assets.Assets.images.svg.lock,
                  ),
                  const Spacer(),
                  FlowTextButton(onPressed: () {
                    AppRouter.router.go(PAGES.home.screenPath);
                  }, text: 'Continue'),
                  const SizedBox(
                    height: Dimensions.size_20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              fontSize: Dimensions.size_20,
                              color: AppColors.dark,
                              fontFamily: FontFamily.minecraft,
                              package: LoginText.package),
                        ),
                        TextSpan(
                          text: "Register!",
                          style: const TextStyle(
                              color: AppColors.text1GradColor,
                              fontSize: Dimensions.size_20,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.minecraft,
                              package: LoginText.package),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
