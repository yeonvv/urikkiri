import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/constants.dart';
import 'package:urikkiri_beta/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String labelText;
  final bool isEnabled;
  final VoidCallback onPressed;

  const FormButton({
    super.key,
    required this.labelText,
    this.isEnabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: AnimatedContainer(
          duration: buttonAnimationDuration,
          height: Sizes.size36,
          decoration: BoxDecoration(
            color: isEnabled
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            border: Border.all(
              color: isEnabled
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size12,
            ),
          ),
          child: Center(
            child: Text(
              labelText,
              style: TextStyle(
                color: isEnabled
                    ? Colors.white
                    : Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
