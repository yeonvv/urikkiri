import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/basic_appbar.dart';
import 'package:urikkiri_beta/features/tips/presentation/widgets/category_button.dart';

class StoreTipsScreen extends StatefulWidget {
  const StoreTipsScreen({super.key});

  @override
  State<StoreTipsScreen> createState() => _StoreTipsScreenState();
}

class _StoreTipsScreenState extends State<StoreTipsScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "커피",
      "destination": const Scaffold(
        appBar: BasicAppbar(title: "커피"),
      ),
    },
    {
      "title": "디카페인",
      "destination": const Scaffold(
        appBar: BasicAppbar(title: "디카페인"),
      ),
    },
    {
      "title": "스무디",
      "destination": const Scaffold(
        appBar: BasicAppbar(title: "스무디"),
      ),
    },
    {
      "title": "티",
      "destination": const Scaffold(
        appBar: BasicAppbar(title: "티"),
      ),
    },
    {
      "title": "라떼",
      "destination": const Scaffold(
        appBar: BasicAppbar(title: "라떼"),
      ),
    },
    {
      "title": "프라푸치노",
      "destination": const Scaffold(
        appBar: BasicAppbar(title: "프라푸치노"),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const BasicAppbar(
            title: "매장 꿀팁",
            searchBar: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size14,
              left: Sizes.size20,
              right: Sizes.size20,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 16 / 9,
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size16,
                mainAxisSpacing: Sizes.size16,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return LongPressDraggable<int>(
                  data: index,
                  feedback: Transform.translate(
                    offset: const Offset(15, 5),
                    child: CategoryButton(
                      item: item["title"],
                      isDragged: true,
                      destination: item["destination"],
                    ),
                  ),
                  childWhenDragging: const SizedBox.shrink(),
                  child: DragTarget(
                    onAcceptWithDetails: (details) {
                      setState(() {
                        final movedItem = items.removeAt(details.data as int);
                        items.insert(index, movedItem);
                      });
                    },
                    builder: (context, candidateData, rejectedData) =>
                        CategoryButton(
                      item: item["title"],
                      isDragged: false,
                      destination: item["destination"],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_rounded,
              size: Sizes.size80,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
        )
      ],
    );
  }
}
