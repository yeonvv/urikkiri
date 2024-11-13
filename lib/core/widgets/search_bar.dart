import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class MainSearchBar extends StatefulWidget {
  final bool decoration;
  final bool isSearch;
  const MainSearchBar({
    super.key,
    this.decoration = false,
    this.isSearch = true,
  });

  @override
  State<MainSearchBar> createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    if (widget.isSearch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_focusNode.hasFocus) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
      });
    }

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.decoration,
      child: Material(
        child: TextField(
          controller: _searchController,
          focusNode: _focusNode,
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
            fillColor: Theme.of(context).disabledColor,
            hintText: "키워드를 입력하세요",
            hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).primaryColorDark.withOpacity(0.4)),
            prefixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: _searchController.text.isNotEmpty
                      ? Sizes.size28
                      : Sizes.size24,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.solidCircleXmark,
                      size: Sizes.size24,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: _clearText,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
