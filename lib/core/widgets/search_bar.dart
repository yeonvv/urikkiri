import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class MainSearchBar extends StatefulWidget {
  const MainSearchBar({super.key});

  @override
  State<MainSearchBar> createState() => _MainSearchBarState();
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
    return TextField(
      controller: _searchController,
      style: Theme.of(context).textTheme.labelLarge,
      cursorColor: Theme.of(context).primaryColor,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.size10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.size10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.only(top: Sizes.size10),
        filled: true,
        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        hintText: "키워드를 입력하세요",
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Theme.of(context).primaryColorLight),
        prefixIcon: Icon(
          EvaIcons.searchOutline,
          size: _searchController.text.isNotEmpty ? Sizes.size28 : Sizes.size24,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  EvaIcons.closeCircle,
                  size: Sizes.size24,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: _clearText,
              )
            : null,
      ),
    );
  }
}
