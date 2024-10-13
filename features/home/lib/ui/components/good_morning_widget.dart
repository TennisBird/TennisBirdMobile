import 'package:home/home.dart';

class GoodMorningWidget extends StatelessWidget {
  const GoodMorningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.size_20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimensions.size_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning,', style: MainText.shellText),
            GradientText(
              "TEST USER",
              style: MainText.shellBoldText,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.text1GradColor, AppColors.text2GradColor],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
