import 'package:flutter/material.dart';
import 'package:urikkiri_beta/features/auth/presentation/login_page.dart';
import 'package:urikkiri_beta/features/auth/presentation/widgets/app_title_text.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  void _loginTap(BuildContext context, bool employee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          isEmployee: employee,
        ),
        settings: const RouteSettings(name: "/login"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => _loginTap(context, false),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const AppTitleText(
                  isEmployee: false,
                  selection: true,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => _loginTap(context, true),
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
