import 'package:flutter/material.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/select_login_option.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SelectLoginOption(isEmployee: false),
          SelectLoginOption(isEmployee: true),
        ],
      ),
    );
  }
}
