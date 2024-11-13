import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/animation_constants.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/features/category/presentation/widgets/media_container.dart';

class ItemDetail extends StatefulWidget {
  final Map<String, dynamic> item;
  const ItemDetail({
    super.key,
    required this.item,
  });

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  bool _isImageVisible = false;
  List<bool> _isTextExpandedList = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: buttonAnimationDuration,
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 3.14).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _isTextExpandedList = List<bool>.filled(
      widget.item["contents"].length,
      false,
    );
  }

  void _closeTap(BuildContext context) {
    Navigator.pop(context);
  }

  void _toggleImageVisibility() {
    setState(() => _isImageVisible = !_isImageVisible);
    if (_isImageVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _toggleTextExpanded(int index) {
    setState(() => _isTextExpandedList[index] = !_isTextExpandedList[index]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.size20),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.item["title"]),
          elevation: 1,
          shadowColor: Colors.black,
          actions: [
            GestureDetector(
              onTap: () => _closeTap(context),
              child: const Padding(
                padding: EdgeInsets.only(right: Sizes.size20),
                child: FaIcon(FontAwesomeIcons.xmark, size: Sizes.size24),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.size20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "영상 ${_isImageVisible ? "펼치기" : "숨기기"}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: _toggleImageVisibility,
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _rotateAnimation.value,
                              child: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                size: Sizes.size20,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: _isImageVisible,
                  child: MediaContainer(
                    isImage: false,
                    mediaUrl: widget.item['video'],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.item["contents"].length,
                  itemBuilder: (context, index) {
                    final content = widget.item["contents"][index];
                    final isOverflowing = _isTextExpandedList[index] ||
                        content["title"].length > 30;
                    return Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: Sizes.size8),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Theme.of(context).disabledColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: Sizes.size5),
                            child: Text(
                              "${index + 1}.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .primaryColorDark
                                        .withOpacity(0.5),
                                  ),
                            ),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: GestureDetector(
                              onTap: isOverflowing
                                  ? () => _toggleTextExpanded(index)
                                  : null,
                              child: Text(
                                widget.item["contents"][index]["title"],
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: _isTextExpandedList[index] ? null : 1,
                                overflow: _isTextExpandedList[index]
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          content["image"].isNotEmpty
                              ? Gaps.h10
                              : const SizedBox(),
                          content["image"].isNotEmpty
                              ? SizedBox(
                                  height: Sizes.size40,
                                  width: Sizes.size40,
                                  child: MediaContainer(
                                    isImage: true,
                                    mediaUrl: content["image"],
                                  ),
                                )
                              : const SizedBox(
                                  height: Sizes.size40,
                                  width: Sizes.size40,
                                )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
