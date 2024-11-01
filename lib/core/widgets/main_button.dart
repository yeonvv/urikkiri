import 'package:flutter/material.dart';
import 'package:flutter_touch_ripple/flutter_touch_ripple.dart';
import 'package:urikkiri_beta/core/constants/animation_constants.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class MainButton extends StatelessWidget {
  final String labelText;
  final bool isEnabled;
  final VoidCallback onPressed;

  const MainButton({
    super.key,
    required this.labelText,
    this.isEnabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: TouchRipple(
        onTapAsync: () async {
          if (isEnabled) {
            await Future.delayed(const Duration(milliseconds: 200));
            onPressed();
          }
        },
        onLongTap: (_) => true,
        rippleColor:
            isEnabled ? Colors.white.withOpacity(0.1) : Colors.transparent,
        rippleBorderRadius: const BorderRadius.all(
          Radius.circular(Sizes.size12),
        ),
        rippleBlurRadius: Sizes.size10,
        longTapCycleDuration: const Duration(milliseconds: 500),
        child: AnimatedContainer(
          duration: buttonAnimationDuration,
          height: Sizes.size36,
          decoration: BoxDecoration(
            color: isEnabled
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(
              Sizes.size12,
            ),
          ),
          child: Center(
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isEnabled
                        ? Colors.white
                        : Theme.of(context).primaryColorLight,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
