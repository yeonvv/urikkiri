import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/animation_constants.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class EditButton extends StatefulWidget {
  final bool editMode;

  const EditButton({
    super.key,
    required this.editMode,
  });

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: buttonAnimationDurationFast,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
    _colorAnimation = ColorTween(
      begin: const Color(0xFF323232),
      end: const Color(0xFF323232).withOpacity(0.7),
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(EditButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.editMode != oldWidget.editMode) {
      _toggleEditAnimation();
    }
  }

  void _toggleEditAnimation() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: 60,
        height: 35,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size4),
        decoration: BoxDecoration(
          color: _colorAnimation.value,
          borderRadius: BorderRadius.circular(Sizes.size12),
        ),
        child: Center(
          child: Text(
            !widget.editMode ? "편집" : "완료",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
