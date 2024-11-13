import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/main_navigation.dart';

class GoToHomeLogo extends StatelessWidget {
  const GoToHomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final mainNavigationState = MainNavigationStateProvider.of(context);
        mainNavigationState?.setIndex(0);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: Sizes.size14,
          left: Sizes.size14,
          right: Sizes.size14,
        ),
        child: Image.asset("assets/images/urikkiri_logo.png"),
      ),
    );
  }
}
