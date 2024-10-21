import 'package:flutter/material.dart';
import 'package:urikkiri_beta/features/Authentication/views/owner_login_page.dart';

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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "올인원 매장관리",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "사장",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            TextSpan(
                              text: "끼리",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "꿀팁 소통창구",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "직원",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            TextSpan(
                              text: "끼리",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
