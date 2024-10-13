import 'package:home/home.dart';
import 'package:home/ui/components/project_tile.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

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
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.size_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recent projects', style: MainText.shellText),
            const SizedBox(height: Dimensions.size_20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(4, (index) {
                return const ProjectTile();
              }),
            ),
            const SizedBox(height: Dimensions.size_10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dark,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.size_30),
                  ),
                ),
                child: const Text(
                  "View All",
                  style: MainText.buttonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
