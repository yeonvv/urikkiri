import 'package:flutter/material.dart';
import 'package:flutter_touch_ripple/flutter_touch_ripple.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class RippleEffect extends StatelessWidget {
  final Widget child;
  final bool editMode;
  final bool brightTone;
  final Widget? destination;
  final String? routeName;
  final double borderRadius;

  const RippleEffect({
    super.key,
    required this.child,
    this.editMode = false,
    this.destination,
    this.routeName,
    required this.brightTone,
    required this.borderRadius,
  });

  void _onNavigationTap(BuildContext context) async {
    if (destination != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => destination!,
          settings: RouteSettings(name: "/$routeName"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TouchRipple(
      onTapAsync: () async {
        FocusScope.of(context).unfocus();
        if (!editMode) {
          await Future.delayed(const Duration(milliseconds: 200));
          _onNavigationTap(context);
        }
      },
      onLongTap: (_) => true,
      rippleColor: editMode
          ? Colors.transparent
          : brightTone
              ? Colors.white.withOpacity(0.1)
              : Theme.of(context).shadowColor.withOpacity(0.1),
      rippleBorderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      rippleBlurRadius: Sizes.size10,
      longTapCycleDuration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}
