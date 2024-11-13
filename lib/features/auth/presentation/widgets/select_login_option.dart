import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/features/auth/presentation/login_page.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';

class SelectLoginOption extends StatelessWidget {
  final bool isEmployee;
  const SelectLoginOption({
    super.key,
    required this.isEmployee,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RippleEffect(
        borderRadius: 0,
        brightTone: isEmployee ? true : false,
        destination: LoginPage(isEmployee: isEmployee),
        routeName: "login",
        child: Container(
          decoration: BoxDecoration(
            color: isEmployee ? Theme.of(context).primaryColor : Colors.white,
            boxShadow: [
              BoxShadow(
                color: isEmployee
                    ? Colors.grey.withOpacity(0.3)
                    : Colors.transparent,
                offset: isEmployee ? const Offset(0, -3) : const Offset(0, 0),
                blurRadius: isEmployee ? 2 : 0,
              ),
            ],
          ),
          child: Center(
            child: AppTitleText(
              isEmployee: isEmployee ? true : false,
              selection: true,
            ),
          ),
        ),
      ),
    );
  }
}
