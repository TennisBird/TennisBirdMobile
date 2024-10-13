import 'package:core_ui/core_ui.dart';

class FlowTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const FlowTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, Dimensions.size_50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.size_5),
        ),
        backgroundColor: const Color.fromARGB(145, 148, 184, 5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Minecraft',
          fontSize: 24,
          package: 'core_ui',
        ),
      ),
    );
  }
}
