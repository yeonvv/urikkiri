import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/animation_constants.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/features/category/presentation/categories_screen.dart';
import 'package:urikkiri_beta/features/home/presentation/home_screen.dart';

class MainNavigationStateProvider extends InheritedWidget {
  final MainNavigationState state;

  const MainNavigationStateProvider({
    super.key,
    required super.child,
    required this.state,
  });

  static MainNavigationState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainNavigationStateProvider>()
        ?.state;
  }

  @override
  bool updateShouldNotify(covariant MainNavigationStateProvider oldWidget) {
    return false;
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const Center(child: Text("할 일")),
    const Center(child: Text("공지")),
    const Center(child: Text("전체")),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainNavigationStateProvider(
      state: this,
      child: Scaffold(
        body: Stack(
          children: List.generate(
            screens.length,
            (index) => Offstage(
              offstage: _selectedIndex != index,
              child: screens[index],
            ),
          ),
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: buttonAnimationDuration,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Theme.of(context).disabledColor),
              left: BorderSide(color: Theme.of(context).disabledColor),
              right: BorderSide(color: Theme.of(context).disabledColor),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Sizes.size20),
              topRight: Radius.circular(Sizes.size20),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: _selectedIndex,
            onTap: _onNavTap,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house), label: "홈"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.lightbulb), label: "카테고리"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.listCheck), label: "할일"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bullhorn), label: "공지"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bars), label: "전체"),
            ],
          ),
        ),
      ),
    );
  }
}
