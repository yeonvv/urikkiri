import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class BasicScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;

  const BasicScaffold({
    super.key,
    required this.body,
    this.appBar,
  });

  void _onScaffoldTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScaffoldTap(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: body,
        ),
      ),
    );
  }
}
