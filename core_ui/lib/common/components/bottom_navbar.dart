import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:core_ui/core_ui.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: const [
        TabItem(icon: Icons.home, title: ''),
        TabItem(icon: Icons.calendar_month, title: ''),
        TabItem(icon: Icons.notifications, title: ''),
        TabItem(icon: Icons.person, title: ''),
        TabItem(icon: Icons.settings, title: ''),
      ],
      initialActiveIndex: _selectedIndex,
      onTap: _onItemTapped,
      style: TabStyle.reactCircle,
      height: 66,
      backgroundColor: AppColors.dark,
      activeColor: AppColors.backgroundColor,
      color: Colors.white,
    );
  }
}
