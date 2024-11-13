import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/add_button.dart';
import 'package:urikkiri_beta/core/widgets/go_to_home_logo.dart';
import 'package:urikkiri_beta/core/widgets/list_tile_model.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/features/category/presentation/item_list_screen.dart';
import 'package:urikkiri_beta/features/search_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "커피",
      "destination": const ItemListScreen(
        categoryTitle: "커피",
      ),
    },
    {
      "title": "디카페인",
      "destination": Stack(
        children: [Container()],
      ),
    },
    {
      "title": "스무디",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "티",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "라떼",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "프라푸치노",
      "destination": Scaffold(
        body: Container(),
      ),
    },
  ];

  bool _editMode = false;

  void _onEditToggle() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  void _searchScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const GoToHomeLogo(),
          title: Text(
            "카테고리",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w800,
                ),
          ),
          titleSpacing: -8,
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: _onEditToggle,
              child: Text(
                _editMode ? "완료" : "편집",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Gaps.h20,
            RippleEffect(
              brightTone: true,
              borderRadius: Sizes.size10,
              destination: const SearchScreen(),
              routeName: "search",
              child: Hero(
                tag: "magnifyingGlass",
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: Sizes.size24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Gaps.h20,
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
                child: _editMode
                    ? const AddButton(
                        object: "카테고리",
                      )
                    : const SizedBox()),
            Gaps.v10,
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return RippleEffect(
                    key: ValueKey(index),
                    borderRadius: 0,
                    brightTone: false,
                    destination: _editMode ? null : category["destination"],
                    child: ListTileModel(
                      item: category,
                      editmode: _editMode ? true : false,
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
