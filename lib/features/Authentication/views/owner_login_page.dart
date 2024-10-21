import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/constants/gaps.dart';
import 'package:urikkiri_beta/constants/sizes.dart';

class OwnerLoginPage extends StatelessWidget {
  const OwnerLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "올인원 매장관리 서비스",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "우리끼리",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: SizedBox(
                      height: Sizes.size36,
                      child: TextField(
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "사업자 등록 번호",
                        ),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: SizedBox(
                      height: Sizes.size36,
                      child: TextField(
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "비밀번호",
                        ),
                      ),
                    ),
                  ),
                  Gaps.v32,
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Container(
                      height: Sizes.size36,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          Sizes.size12,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "우리 팀 관리하기",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        size: Sizes.size16,
                        color: Colors.grey.shade400,
                      ),
                      Gaps.h10,
                      Text(
                        "로그인 유지",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade400,
                            ),
                      ),
                    ],
                  ),
                  Gaps.v16,
                  Text(
                    "처음 오는 대장코끼리",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Gaps.v16,
                  const Text("비밀번호를 잊어버렸어요"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
