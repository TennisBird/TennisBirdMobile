import 'package:core_ui/common/components/text_button.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:navigation/configs/route_util.dart';
import 'package:navigation/navigation.dart';
import 'package:register/constants/register_text.dart';
import 'package:register/ui/components/transparent_text_field.dart';
import 'package:register/util/assets.gen.dart' as register_assets;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  const GradientText(RegisterText.register,
                      style: MainText.regText,
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
                    hintText: RegisterText.username,
                    icon: register_assets.Assets.images.svg.user,
                  ),
                  const SizedBox(
                    height: Dimensions.size_20,
                  ),
                  TransparentTextField(
                    hintText: RegisterText.email,
                    icon: register_assets.Assets.images.svg.mail,
                  ),
                  const SizedBox(
                    height: Dimensions.size_20,
                  ),
                  TransparentTextField(
                    hintText: RegisterText.password,
                    icon: register_assets.Assets.images.svg.lock,
                  ),
                  const SizedBox(
                    height: Dimensions.size_20,
                  ),
                  TransparentTextField(
                    hintText: RegisterText.confirm_password,
                    icon: register_assets.Assets.images.svg.lock,
                  ),
                  const Spacer(),
                  FlowTextButton(onPressed: () {
                    AppRouter.router.go(PAGES.error.screenPath);
                  }, text: 'Continue'),
                  const SizedBox(
                    height: Dimensions.size_20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                              fontSize: Dimensions.size_20,
                              color: AppColors.dark,
                              fontFamily: FontFamily.minecraft,
                              package: RegisterText.package),
                        ),
                        TextSpan(
                          text: "Login!",
                          style: const TextStyle(
                              color: AppColors.text1GradColor,
                              fontSize: Dimensions.size_20,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.minecraft,
                              package: RegisterText.package),
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
