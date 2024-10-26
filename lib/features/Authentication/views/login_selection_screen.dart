import 'package:flutter/material.dart';
import 'package:urikkiri_beta/features/Authentication/views/owner_views/owner_login_page.dart';
import 'package:urikkiri_beta/features/Authentication/views/widgets/app_title_text.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});
  void _ownerLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OwnerLoginPage(),
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
              onTap: () => _ownerLoginTap(context),
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
              onTap: () {},
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
