import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/features/auth/presentation/login_page.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: RippleEffect(
              brightTone: false,
              destination: const LoginPage(isEmployee: false),
              routeName: "login",
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                  child: AppTitleText(
                    isEmployee: false,
                    selection: true,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: RippleEffect(
              brightTone: true,
              destination: const LoginPage(isEmployee: true),
              routeName: "login",
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, -3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: AppTitleText(
                    selection: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
