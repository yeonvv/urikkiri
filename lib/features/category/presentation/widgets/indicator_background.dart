import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';

class IndicatorBackground extends StatelessWidget {
  final bool isImage;
  final bool isLoading;
  final bool isError;
  const IndicatorBackground({
    super.key,
    required this.isImage,
    this.isLoading = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: !isError
              ? !isLoading
                  ? Text(
                      "영상이 없습니다",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !isImage
                            ? Text(
                                "영상 로딩 중",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              )
                            : const SizedBox(),
                        !isImage ? Gaps.h10 : const SizedBox(),
                        Center(
                          child: SizedBox(
                            height: Sizes.size18,
                            width: Sizes.size18,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                              strokeWidth: Sizes.size3,
                            ),
                          ),
                        )
                      ],
                    )
              : Center(
                  child: FaIcon(
                    FontAwesomeIcons.triangleExclamation,
                    size: isImage ? Sizes.size20 : Sizes.size40,
                    color: Colors.white,
                  ),
                ),
        ),
        Center(
          child: Opacity(
            opacity: 0.2,
            child: AspectRatio(
              aspectRatio: 0.5,
              child: Image.asset(
                "assets/images/urikkiri_logo.png",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
