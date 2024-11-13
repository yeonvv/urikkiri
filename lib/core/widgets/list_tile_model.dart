import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/features/category/presentation/widgets/media_container.dart';

class ListTileModel extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool editmode;
  final bool detail;

  const ListTileModel({
    super.key,
    required this.item,
    this.editmode = false,
    this.detail = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTextStyle = theme.textTheme.titleLarge;
    final subtitleTextStyle = theme.textTheme.titleSmall?.copyWith(
      fontSize: Sizes.size16,
      color: Colors.grey,
    );

    Widget? trailingWidget;
    if (!editmode) {
      if (detail && item["image"].isNotEmpty) {
        trailingWidget = MediaContainer(isImage: true, mediaUrl: item["image"]);
      } else if (!detail) {
        trailingWidget = Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
            vertical: Sizes.size5,
          ),
          decoration: BoxDecoration(
            color: theme.disabledColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(Sizes.size8),
          ),
          child: FaIcon(
            FontAwesomeIcons.chevronRight,
            color: theme.primaryColorDark.withOpacity(0.5),
            size: Sizes.size14,
          ),
        );
      }
    } else {
      trailingWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("편집", style: theme.textTheme.bodyMedium),
          Gaps.h20,
          Text("삭제", style: theme.textTheme.bodyMedium),
        ],
      );
    }

    return Material(
      color: Colors.white,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: detail ? 0 : Sizes.size5),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: theme.disabledColor),
          ),
        ),
        child: ListTile(
          titleTextStyle: titleTextStyle,
          subtitleTextStyle: subtitleTextStyle,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size4,
          ),
          title: Text(item["title"]),
          subtitle: item["subtitle"] != null ? Text(item["subtitle"]) : null,
          trailing: trailingWidget,
        ),
      ),
    );
  }
}
