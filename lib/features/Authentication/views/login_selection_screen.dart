import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/sizes.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "올인원 매장관리",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size18,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "사장",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.size52,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: "끼리",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Sizes.size52,
                              fontWeight: FontWeight.w900,
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
          Expanded(
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
                    const Text(
                      "꿀팁 소통창구",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size18,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "직원",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.size52,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: "끼리",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size52,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
