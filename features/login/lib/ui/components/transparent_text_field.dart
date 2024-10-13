import 'package:core_ui/core_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransparentTextField extends StatelessWidget {
  final String hintText;
  final String icon;
  final bool obscureText;

  const TransparentTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(
          color: AppColors.dark,
          fontSize: 16,
          fontFamily: FontFamily.minecraft,
          package: "core_ui"),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.dark,
              BlendMode.srcIn,
            ),
            width: Dimensions.size_16,
            height: Dimensions.size_16,
            package: "login",
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: AppColors.dark,
            fontFamily: FontFamily.minecraft,
            package: "core_ui"),
        filled: true,
        fillColor: Colors.white.withOpacity(0.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.size_10),
          borderSide: const BorderSide(
            color: AppColors.dark,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.size_10),
          borderSide: const BorderSide(
            color: AppColors.dark,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
