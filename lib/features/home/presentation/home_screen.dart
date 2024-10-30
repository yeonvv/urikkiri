import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/edit_button.dart';
import 'package:urikkiri_beta/core/widgets/search_bar.dart';
import 'package:urikkiri_beta/features/home/presentation/widgets/navigation_tap.dart';

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
    {
      'title': "매장 꿀 팁",
      'destination': Scaffold(appBar: AppBar(title: const Text("매장 꿀 팁")))
    },
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
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _toggleEditMode() {
    setState(() {
      _editMode = !_editMode;
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
          leading: Padding(
            padding: const EdgeInsets.only(left: Sizes.size16),
            child: Image.asset("assets/images/urikkiri_text_logo.png"),
          ),
          actions: [
            IconButton(
              onPressed: _onScaffoldTap,
              icon: const Icon(Icons.settings),
              highlightColor: Colors.transparent,
              color: Theme.of(context).primaryColorDark,
            )
          ],
          leadingWidth: Sizes.size96 + Sizes.size14,
          bottom: const MainSearchBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 135,
                    width: 250,
                    child: FractionallySizedBox(
                      widthFactor: 1.5,
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
                              child: Card(
                                shadowColor: Colors.transparent,
                                elevation: 4,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                          );
                        },
                      ),
                    ),
                  ),
                  Gaps.v10,
                  !_editMode
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var item in _navigationItems)
                              NavigationTap(
                                key: ValueKey(item['title']),
                                tabTitle: item['title'],
                                destination: item['destination'],
                                editMode: _editMode,
                              ),
                          ],
                        )
                      : ReorderableListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          onReorder: (int oldIndex, int newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) newIndex -= 1;
                              final item = _navigationItems.removeAt(oldIndex);
                              _navigationItems.insert(newIndex, item);
                            });
                          },
                          children: [
                            for (int index = 0;
                                index < _navigationItems.length;
                                index++)
                              ReorderableDelayedDragStartListener(
                                key: ValueKey(_navigationItems[index]["title"]),
                                index: index,
                                child: Material(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: NavigationTap(
                                          key: ValueKey(
                                              _navigationItems[index]['title']),
                                          tabTitle: _navigationItems[index]
                                              ['title'],
                                          destination: _navigationItems[index]
                                              ['destination'],
                                          editMode: _editMode,
                                        ),
                                      ),
                                      _editMode
                                          ? Icon(
                                              Icons.menu_rounded,
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                            )
                                          : Container(),
                                      _editMode ? Gaps.h16 : const SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                  Gaps.v10,
                  GestureDetector(
                    onTap: _toggleEditMode,
                    child: EditButton(
                      editMode: _editMode,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
