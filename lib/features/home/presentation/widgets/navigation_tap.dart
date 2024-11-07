import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';

class NavigationTap extends StatefulWidget {
  final String tabTitle;
  final Widget destination;
  final String routeName;
  final bool editMode;

  const NavigationTap({
    super.key,
    required this.tabTitle,
    required this.destination,
    this.editMode = false,
    required this.routeName,
  });

  @override
  State<NavigationTap> createState() => _NavigationTapState();
}

class _NavigationTapState extends State<NavigationTap> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return RippleEffect(
      borderRadius: Sizes.size16,
      brightTone: false,
      editMode: widget.editMode,
      destination: widget.destination,
      routeName: widget.routeName,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: widget.editMode ? width - 80 : width - 40,
            decoration: BoxDecoration(
              color: widget.editMode
                  ? Theme.of(context).primaryColorDark
                  : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.size16),
              ),
              border: Border.all(
                color: widget.editMode
                    ? Colors.transparent
                    : Theme.of(context).primaryColorDark,
                width: widget.editMode ? 0 : Sizes.size1,
              ),
            ),
            child: Text(
              widget.tabTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: widget.editMode ? Colors.white : null),
            ),
          ),
          widget.editMode ? Gaps.h16 : const SizedBox(),
          widget.editMode
              ? Icon(
                  Icons.menu_rounded,
                  color: Theme.of(context).primaryColorDark,
                )
              : Container(),
        ],
      ),
    );
  }
}
