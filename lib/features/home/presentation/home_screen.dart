import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/edit_button.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/core/widgets/search_bar.dart';
import 'package:urikkiri_beta/features/home/presentation/widgets/navigation_tap.dart';
import 'package:urikkiri_beta/features/tips/presentation/store_tips_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  bool _editMode = false;
  int _currentPage = 0;

  final List<Map<String, dynamic>> _navigationItems = [
    {
      'title': "오늘 할 일",
      'destination': Scaffold(appBar: AppBar(title: const Text("오늘 할 일")))
    },
    {'title': "매장 꿀팁", 'destination': const StoreTipsScreen()},
    {
      'title': "공지사항",
      'destination': Scaffold(appBar: AppBar(title: const Text("공지사항")))
    },
    {
      'title': "건의사항",
      'destination': Scaffold(appBar: AppBar(title: const Text("건의사항")))
    },
    {
      'title': "메모",
      'destination': Scaffold(appBar: AppBar(title: const Text("메모")))
    },
    {
      'title': "설정",
      'destination': Scaffold(appBar: AppBar(title: const Text("설정")))
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _toggleEditMode() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _navigationItems.removeAt(oldIndex);
      _navigationItems.insert(newIndex, item);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leading: Row(
            children: [
              Gaps.h20,
              Image.asset(
                "assets/images/urikkiri_text_logo.png",
                width: 100,
              ),
            ],
          ),
          leadingWidth: 120,
          actions: [
            GestureDetector(
              onTap: _toggleEditMode,
              child: EditButton(
                editMode: _editMode,
              ),
            ),
            Gaps.h20,
          ],
          bottom: const MainSearchBar(),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: FractionallySizedBox(
                widthFactor: 1.02,
                child: SizedBox(
                  height: 130,
                  width: 250,
                  child: PageView.builder(
                    clipBehavior: Clip.none,
                    controller: _pageController,
                    itemCount: 5,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final scale = index == _currentPage ? 1.0 : 0.8;
                      return Transform.translate(
                        offset: const Offset(0, 0),
                        child: Transform.scale(
                          scale: scale,
                          child: RippleEffect(
                            brightTone: false,
                            child: Card(
                              shadowColor: Colors.transparent,
                              color: Colors.blue[(index + 1) * 100],
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Card ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '${index + 1}/5 모두보기',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Gaps.v20,
            _editMode
                ? Expanded(
                    child: ReorderableListView.builder(
                      itemCount: _navigationItems.length,
                      itemBuilder: (context, index) {
                        final item = _navigationItems[index];
                        final bottomPadding =
                            index == (_navigationItems.length - 1)
                                ? Sizes.size24
                                : Sizes.size8;
                        return Material(
                          key: ValueKey(item["title"]),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Sizes.size8,
                              bottom: bottomPadding,
                              left: Sizes.size20,
                              right: Sizes.size20,
                            ),
                            child: NavigationTap(
                              tabTitle: item["title"],
                              destination: item["destination"],
                              editMode: true,
                            ),
                          ),
                        );
                      },
                      onReorder: _onReorder,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _navigationItems.length,
                      itemBuilder: (context, index) {
                        final item = _navigationItems[index];
                        final bottomPadding =
                            index == (_navigationItems.length - 1)
                                ? Sizes.size24
                                : Sizes.size8;
                        return Padding(
                          padding: EdgeInsets.only(
                            top: Sizes.size8,
                            bottom: bottomPadding,
                            left: Sizes.size20,
                            right: Sizes.size20,
                          ),
                          child: NavigationTap(
                            tabTitle: item["title"],
                            destination: item["destination"],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
