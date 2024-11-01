import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/search_bar.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool searchBar;
  const BasicAppbar({
    super.key,
    required this.title,
    this.searchBar = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(151);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: searchBar ? 100 : 80,
      leading: IconButton(
        highlightColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left_rounded,
          size: Sizes.size40,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      title: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w800,
                ),
          ),
          Text(
            "뒷골목 친구들",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
        ],
      ),
      bottom: searchBar
          ? const MainSearchBar()
          : PreferredSize(preferredSize: preferredSize, child: Container()),
    );
  }
}
