import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';

class AddButton extends StatelessWidget {
  final String object;
  const AddButton({
    super.key,
    required this.object,
  });

  @override
  Widget build(BuildContext context) {
    return RippleEffect(
      borderRadius: Sizes.size10,
      brightTone: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size11,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.size10),
          ),
        ),
        child: Text(
          "$object 추가",
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
