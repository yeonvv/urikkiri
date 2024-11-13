import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/utils/appbar_pop.dart';
import 'package:urikkiri_beta/core/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  final bool isHomePage;
  const SearchScreen({
    super.key,
    this.isHomePage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarPop(),
        title: Text(
          "검색",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800,
              ),
        ),
        centerTitle: false,
        titleSpacing: -8,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size20,
          right: Sizes.size20,
          bottom: Sizes.size20,
        ),
        child: isHomePage
            ? const Hero(
                tag: "search-bar",
                child: MainSearchBar(),
              )
            : const Hero(
                tag: "magnifyingGlass",
                child: MainSearchBar(),
              ),
      ),
    );
  }
}
