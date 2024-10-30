import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class MainSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const MainSearchBar({super.key});

  @override
  State<MainSearchBar> createState() => _MainSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.size52);
}

class _MainSearchBarState extends State<MainSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  void _clearText() {
    _searchController.clear();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: TextField(
        controller: _searchController,
        style: Theme.of(context).textTheme.labelLarge,
        cursorColor: Theme.of(context).primaryColor,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          hintText: "키워드를 입력하세요",
          hintStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).primaryColorLight),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search_rounded,
              size: Sizes.size36,
              color: Theme.of(context).primaryColor,
            ),
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel_rounded,
                      size: Sizes.size28,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: _clearText,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.size36),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.size36),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: Sizes.size2,
            ),
          ),
        ),
      ),
    );
  }
}
