import 'package:home/home.dart';
import 'package:home/util/assets.gen.dart' as home_assets;

class TeamsWidget extends StatefulWidget {
  const TeamsWidget({super.key});

  @override
  State<TeamsWidget> createState() => _TeamsWidgetState();
}

class _TeamsWidgetState extends State<TeamsWidget> {
  final ScrollController _scrollController = ScrollController();
  double _currentScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _currentScrollPosition = _scrollController.offset;
      });
    });
  }

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
            const Text('Your teams', style: MainText.shellText),
            const SizedBox(height: Dimensions.size_10),
            SizedBox(
              height: Dimensions.size_120,
              child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    double itemPosition = index * 120 - _currentScrollPosition;
                    double opacity = 1.0;
                    if (itemPosition < -100 ||
                        itemPosition > MediaQuery.of(context).size.width) {
                      opacity = 0.0;
                    } else if (itemPosition < 0 ||
                        itemPosition >
                            MediaQuery.of(context).size.width - 60) {
                      opacity = 0.5;
                    }
                    return AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: Dimensions.size_40,
                              backgroundColor: AppColors.backgroundColor,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                    home_assets.Assets.images.png.love.path,
                                    package: "home"),
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.size_5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'demo',
                                style: MainText.buttonText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
