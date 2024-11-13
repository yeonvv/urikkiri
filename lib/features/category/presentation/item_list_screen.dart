import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/utils/appbar_pop.dart';
import 'package:urikkiri_beta/core/widgets/add_button.dart';
import 'package:urikkiri_beta/core/widgets/list_tile_model.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/features/category/presentation/item_detail_screen.dart';

class ItemListScreen extends StatefulWidget {
  final String categoryTitle;
  const ItemListScreen({
    super.key,
    required this.categoryTitle,
  });

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Map<String, dynamic>> menus = [
    {
      "title": "아메리카노",
      "subtitle": "물 250, 투샷",
      "image":
          "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
      "video":
          "https://www.shutterstock.com/shutterstock/videos/3523218445/preview/stock-footage-vertical-closeup-of-human-female-long-black-straight-hair-texture-in-slow-motion.webm",
      "contents": [
        {
          "title":
              "물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물물",
          "image":
              "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        },
        {
          "title": "얼음 가득",
          "image": "",
        },
        {
          "title": "16Oz 투샷",
          "image":
              "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        },
        {
          "title": "16Oz 투샷",
          "image":
              "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        },
        {
          "title": "16Oz 투샷",
          "image":
              "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        },
        {
          "title": "16Oz 투샷",
          "image":
              "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        },
        {
          "title": "16Oz 투샷",
          "image": "https://image.utoimage.com/preview/202212008462_500.jpg",
        },
        {
          "title": "16Oz 투샷",
          "image": "",
        },
        {
          "title": "16Oz 투샷",
          "image":
              "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
        },
      ]
    },
    {
      "title": "카페라떼",
      "subtitle": "16온스",
      "image": "",
      "destination": Stack(
        children: [Container()],
      ),
    },
    {
      "title": "돌체라떼",
      "subtitle": "only ice, 24온스",
      "image": "",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "카라멜 마끼아또",
      "subtitle": "24온스",
      "image": "",
      "destination": Scaffold(
        body: Container(),
      ),
    },
    {
      "title": "수제 바닐라 라떼",
      "subtitle": "16온스",
      "image":
          "https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg",
      "video": "",
      "content": [
        "우유 250ml",
        "바닐라 시럽 3펌프",
        "24Oz 투샷",
        "얼음",
      ],
    },
    {
      "title": "카페모카",
      "subtitle": "24온스",
      "image": "",
      "destination": Scaffold(
        body: Container(),
      ),
    },
  ];
  bool _editMode = false;

  void _onEditToggle() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  void _openBottomSheet(BuildContext context,
      {required Map<String, dynamic> item}) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.93,
      context: context,
      builder: (BuildContext context) {
        return ItemDetail(
          item: item,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarPop(),
        title: Text(
          widget.categoryTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800,
              ),
        ),
        titleSpacing: -8,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: _onEditToggle,
            child: Text(
              _editMode ? "완료" : "편집",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Gaps.h20,
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: _editMode
                ? AddButton(
                    object: widget.categoryTitle,
                  )
                : null,
          ),
          Gaps.v10,
          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                return RippleEffect(
                  borderRadius: 0,
                  brightTone: false,
                  callFunction: _editMode
                      ? null
                      : () => _openBottomSheet(context, item: menu),
                  child: ListTileModel(
                    item: menu,
                    detail: true,
                    editmode: _editMode,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
