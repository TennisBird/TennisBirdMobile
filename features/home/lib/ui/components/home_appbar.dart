import 'package:home/constants/home_text.dart';
import 'package:home/home.dart';
import 'package:home/util/assets.gen.dart' as home_assets;

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.size_10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.headerGrad1, AppColors.headerGrad2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.size_20),
              bottomRight: Radius.circular(Dimensions.size_20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      ),
      title: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.size_10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                        home_assets.Assets.images.png.bird.path,
                        package: HomeText.package),
                    radius: Dimensions.size_20,
                  ),
                  const SizedBox(
                    width: Dimensions.size_10,
                  ),
                  const GradientText(
                    HomeText.logoText,
                    style: MainText.appbarText,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.text1GradColor,
                        AppColors.text2GradColor
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: Dimensions.size_10,
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        home_assets.Assets.images.png.avatar.path,
                        package: HomeText.package),
                    radius: Dimensions.size_20,
                  ),
                  const SizedBox(
                    width: Dimensions.size_10,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
