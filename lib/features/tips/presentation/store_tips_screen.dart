import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/core/widgets/search_bar.dart';

class StoreTipsScreen extends StatefulWidget {
  const StoreTipsScreen({super.key});

  @override
  State<StoreTipsScreen> createState() => _StoreTipsScreenState();
}

class _StoreTipsScreenState extends State<StoreTipsScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "커피",
      "subtitle": "16온스",
      "destination": Scaffold(
        appBar: AppBar(
          title: const Text("커피"),
        ),
        body: Container(),
      ),
    },
    {
      "title": "디카페인",
      "subtitle": "16온스",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "스무디",
      "subtitle": "only 24온스",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "티",
      "subtitle": "24온스",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "라떼",
      "subtitle": "16온스",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "프라푸치노",
      "subtitle": "only 24온스",
      "destination": Scaffold(
        body: Container(),
      ),
    },
  ];

  bool _editMode = false;
  bool _isDraggable = false;

  void _onEditToggle() {
    setState(() {
      _editMode = !_editMode;
      _isDraggable = !_isDraggable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: Row(
              children: [
                Gaps.h20,
                Text(
                  "매장 꿀팁",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            leadingWidth: 120,
            actions: [
              GestureDetector(
                onTap: _onEditToggle,
                child: Text(_editMode ? "완료" : "편집",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Gaps.h20,
            ],
            centerTitle: false,
          ),
          body: Column(
            children: [
              Gaps.v10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
                child: _editMode
                    ? RippleEffect(
                        borderRadius: Sizes.size10,
                        brightTone: true,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size11,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Sizes.size10),
                            ),
                          ),
                          child: Text(
                            "추가",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : const MainSearchBar(),
              ),
              Gaps.v10,
              Expanded(
                child: _editMode
                    ? ReorderableListView(
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            if (newIndex > oldIndex) {
                              newIndex -= 1;
                            }
                            final item = categories.removeAt(oldIndex);
                            categories.insert(newIndex, item);
                          });
                        },
                        children: List.generate(
                          categories.length,
                          (index) {
                            final category = categories[index];
                            return Material(
                              color: Colors.white,
                              key: ValueKey(index),
                              elevation: 0,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size24,
                                  vertical: Sizes.size4,
                                ),
                                title: Text(
                                  category["title"],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                subtitle: Text(
                                  category["subtitle"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: Sizes.size16,
                                        color: Colors.grey,
                                      ),
                                ),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(EvaIcons.menu),
                                    Gaps.h20,
                                    Text(
                                      "삭제",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Material(
                            color: Colors.white,
                            elevation: 0,
                            child: RippleEffect(
                              borderRadius: 0,
                              brightTone: false,
                              destination: category["destination"],
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size24,
                                  vertical: Sizes.size4,
                                ),
                                title: Text(
                                  category["title"],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                subtitle: Text(
                                  category["subtitle"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: Sizes.size16,
                                        color: Colors.grey,
                                      ),
                                ),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                    vertical: Sizes.size4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).disabledColor,
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size10),
                                  ),
                                  child: Text(
                                    "상세",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
