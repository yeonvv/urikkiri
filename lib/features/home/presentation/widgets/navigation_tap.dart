import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/animation_constants.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class NavigationTap extends StatefulWidget {
  final String tabTitle;
  final Widget destination;

  const NavigationTap({
    super.key,
    required this.tabTitle,
    required this.destination,
  });

  @override
  State<NavigationTap> createState() => _NavigationTapState();
}

class _NavigationTapState extends State<NavigationTap> {
  bool _isTapped = false;

  void _onNavigationTapDown(TapDownDetails event) {
    _isTapped = !_isTapped;
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  void _onNavigationTapUp(TapUpDetails event) {
    _isTapped = !_isTapped;
    setState(() {});
    _navigateToDestination();
  }

  void _onNavigationTapCancle() {
    _isTapped = false;
    setState(() {});
  }

  void _navigateToDestination() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget.destination,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.v10,
        GestureDetector(
          onTapDown: _onNavigationTapDown,
          onTapUp: _onNavigationTapUp,
          onTapCancel: _onNavigationTapCancle,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: AnimatedContainer(
              duration: buttonAnimationDurationFast,
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Sizes.size12),
                ),
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    width: _isTapped ? Sizes.size3 : Sizes.size1),
                boxShadow: [
                  BoxShadow(
                    color: _isTapped
                        ? Theme.of(context).primaryColor.withOpacity(0.07)
                        : Theme.of(context).primaryColor.withOpacity(0.03),
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Text(widget.tabTitle,
                  style: _isTapped
                      ? Theme.of(context).textTheme.titleMedium!.copyWith(
                          letterSpacing: -2, fontWeight: FontWeight.w600)
                      : Theme.of(context).textTheme.titleLarge!.copyWith(
                          letterSpacing: -2, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        Gaps.v10,
      ],
    );
  }
}
