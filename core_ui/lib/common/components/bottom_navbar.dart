import 'dart:math';

import 'package:core_ui/util/assets.gen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _previousIndex = 0;
  late AnimationController _controller;

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });

    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int itemCount = _items.length;

    double xStart = (_previousIndex + 0.5) * (width / itemCount);
    double xEnd = (_currentIndex + 0.5) * (width / itemCount);

    double xPosition = xStart + (_controller.value) * (xEnd - xStart);
    double rotationAngle = _controller.value * 2 * pi;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomNavigationBar(
          items: _items,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        Positioned(
          bottom: 30,
          left: xPosition - 25,
          child: Transform.rotate(
            angle: rotationAngle,
            child: Image.asset(
              Assets.png.tennisBird.path,
              package: 'core_ui',
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
