import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class AppBarPop extends StatelessWidget {
  const AppBarPop({super.key});

  void popPage(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => popPage(context),
      child: const Padding(
        padding: EdgeInsets.only(
            top: Sizes.size20 + Sizes.size1, left: Sizes.size20),
        child: FaIcon(
          FontAwesomeIcons.chevronLeft,
          size: Sizes.size20,
        ),
      ),
    );
  }
}
