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
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: buttonAnimationDurationFast,
    );
  }

  @override
  void didUpdateWidget(EditButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 상태 변화에 따른 애니메이션 효과
    if (widget.editMode != oldWidget.editMode) {
      _toggleEditAnimation();
    }
  }

  void _toggleEditAnimation() {
    setState(() {
      _scale = 0.9;
    });
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
      scale: Tween<double>(begin: 1.0, end: _scale).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      ),
      child: Container(
        width: 80,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size4),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(Sizes.size12),
        ),
        child: Center(
          child: Text(
            !widget.editMode ? "편집" : "완료",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
