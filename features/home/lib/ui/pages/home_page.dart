import 'dart:ui';

import 'package:core_ui/common/components/bottom_navbar.dart';
import 'package:home/home.dart';
import 'package:home/ui/components/bottom_sheet.dart';
import 'package:home/ui/components/good_morning_widget.dart';
import 'package:home/ui/components/home_appbar.dart';
import 'package:home/ui/components/projects_widget.dart';
import 'package:home/ui/components/teams_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  double _blurValue = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _blurValue = (_scrollController.offset / 100).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => Expanded(
                        child: Align(
                          alignment: index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            width: 50,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  blurRadius: 300,
                                  spreadRadius: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.size_16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: Dimensions.size_16,
                          ),
                          _buildBlurringElement(const GoodMorningWidget(), 0),
                          const SizedBox(
                            height: Dimensions.size_16,
                          ),
                          _buildBlurringElement(const ProjectsWidget(), 1),
                          const SizedBox(
                            height: Dimensions.size_16,
                          ),
                          _buildBlurringElement(const TeamsWidget(), 2),
                          const SizedBox(
                            height: Dimensions.size_20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HomeBottomSheet(),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }

  Widget _buildBlurringElement(Widget child, int index) {
    if (index < 1) {
      return Opacity(
        opacity: (1 - _blurValue).clamp(0.0, 1.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _blurValue * 10,
              sigmaY: _blurValue * 10,
            ),
            child: child,
          ),
        ),
      );
    } else {
      return child;
    }
  }
}
