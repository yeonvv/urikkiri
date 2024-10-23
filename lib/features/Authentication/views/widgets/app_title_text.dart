import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  final bool isEmployee;
  final bool selection;

  const AppTitleText({
    super.key,
    required this.isEmployee,
    this.selection = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isEmployee ? "꿀팁 소통창구" : "올인원 매장관리",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        !selection
            ? Text(
                "우리끼리",
                style: Theme.of(context).textTheme.titleLarge,
              )
            : RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: isEmployee ? "직원" : "사장",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    ),
                    TextSpan(
                      text: "끼리",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: selection && !isEmployee
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
