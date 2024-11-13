import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class CategoryButton extends StatelessWidget {
  final String item;
  final bool isDragged;
  final Widget destination;
  const CategoryButton({
    super.key,
    required this.item,
    this.isDragged = false,
    required this.destination,
  });

  void _insideCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _insideCategory(context),
      child: Container(
        width: isDragged ? 150 : null,
        height: isDragged ? 90 : null,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDragged ? Theme.of(context).primaryColorDark : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size16),
          border: Border.all(
            color: Theme.of(context).primaryColorDark,
            width: isDragged ? 0 : 1,
          ),
        ),
        child: Text(
          item,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isDragged
                    ? Colors.white
                    : Theme.of(context).primaryColorDark,
                fontWeight: isDragged ? FontWeight.w800 : null,
              ),
        ),
      ),
    );
  }
}
