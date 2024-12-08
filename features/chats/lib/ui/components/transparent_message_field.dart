import 'package:core_ui/core_ui.dart';

class TransparentMessageField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController textEditingController;

  const TransparentMessageField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: textEditingController,
      style: const TextStyle(
          color: AppColors.dark,
          fontSize: 16,
          fontFamily: FontFamily.minecraft,
          package: "core_ui"),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: AppColors.dark,
            fontFamily: FontFamily.minecraft,
            package: "core_ui"),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
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
