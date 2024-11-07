import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/features/home/presentation/home_screen.dart';
import 'package:urikkiri_beta/features/tips/presentation/store_tips_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final screens = [
    const HomeScreen(),
    const StoreTipsScreen(),
    const Center(
      child: Text("할 일"),
    ),
    const Center(
      child: Text("공지"),
    ),
    const Center(
      child: Text("전체"),
    ),
  ];

  void _onNavTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Theme.of(context).disabledColor),
            left: BorderSide(color: Theme.of(context).disabledColor),
            right: BorderSide(color: Theme.of(context).disabledColor),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              Sizes.size20,
            ),
            topRight: Radius.circular(
              Sizes.size20,
            ),
          ),
        ),
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            size: Sizes.size32,
            color: Theme.of(context).primaryColor,
          ),
          unselectedIconTheme: IconThemeData(
            size: Sizes.size28,
            color: Theme.of(context).primaryColorLight,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onNavTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.bulb),
              label: "꿀팁",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.checkmarkSquare2),
              label: "할일",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.volumeDown),
              label: "공지",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.menu),
              label: "전체",
            ),
          ],
        ),
      ),
    );
  }
}
