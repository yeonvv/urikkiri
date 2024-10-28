import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';

class AppTitleText extends StatelessWidget {
  final bool isEmployee;
  final bool selection;

  const AppTitleText({
    super.key,
    this.isEmployee = true,
    this.selection = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!selection) Gaps.v60,
        Text(
          isEmployee ? "꿀팁 소통창구" : "올인원 매장관리",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        !selection
            ? Text(
                "우리끼리",
                style: Theme.of(context).textTheme.displayLarge,
              )
            : RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: isEmployee ? "직원" : "사장",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: "끼리",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: selection && !isEmployee
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                    ),
                  ],
                ),
              ),
        if (!selection) Gaps.v96,
      ],
    );
  }
}
