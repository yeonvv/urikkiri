import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class MaintainLoginButton extends StatefulWidget {
  const MaintainLoginButton({super.key});

  @override
  State<MaintainLoginButton> createState() => _MaintainLoginButtonState();
}

class _MaintainLoginButtonState extends State<MaintainLoginButton> {
  bool _onChecked = false;

  void _onTap() {
    _onChecked = !_onChecked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.solidCircleCheck,
            size: Sizes.size16,
            color: _onChecked
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorLight,
          ),
          Gaps.h10,
          Text(
            "로그인 유지",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: _onChecked
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                ),
          ),
        ],
      ),
    );
  }
}
