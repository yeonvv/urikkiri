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
  final VoidCallback? callFunction;

  const RippleEffect({
    super.key,
    required this.child,
    this.editMode = false,
    this.destination,
    this.routeName,
    required this.brightTone,
    required this.borderRadius,
    this.callFunction,
  });

  void _onNavigationTap(BuildContext context) async {
    if (destination != null) {
      await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return destination!;
          },
          settings: RouteSettings(name: "/$routeName"),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
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
          await Future.delayed(const Duration(milliseconds: 150));
          if (callFunction != null) {
            callFunction!();
          } else {
            _onNavigationTap(context);
          }
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
