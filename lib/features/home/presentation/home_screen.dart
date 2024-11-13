import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/gaps.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/core/widgets/ripple_effect.dart';
import 'package:urikkiri_beta/core/widgets/search_bar.dart';
import 'package:urikkiri_beta/features/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size20,
            ),
            child: Image.asset("assets/images/urikkiri_text_logo.png"),
          ),
          leadingWidth: 95,
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "뒷골목 친구들",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.5)),
                ),
                Gaps.h8,
                Center(
                  child: FaIcon(
                    FontAwesomeIcons.gear,
                    size: Sizes.size18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Gaps.h20
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size20,
            right: Sizes.size20,
            bottom: Sizes.size20,
          ),
          child: Column(
            children: [
              const RippleEffect(
                borderRadius: Sizes.size10,
                brightTone: false,
                destination: SearchScreen(
                  isHomePage: true,
                ),
                child: Hero(
                  tag: "search-bar",
                  child: MainSearchBar(
                    decoration: true,
                    isSearch: false,
                  ),
                ),
              ),
              Gaps.v10,
              SizedBox(
                height: 150,
                width: double.infinity,
                child: PageView.builder(
                  clipBehavior: Clip.none,
                  controller: _pageController,
                  itemCount: 5,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final scale = index == _currentPage ? 1.0 : 0.8;
                    return Transform.translate(
                      offset: const Offset(0, 0),
                      child: Transform.scale(
                        scale: scale,
                        child: RippleEffect(
                          brightTone: false,
                          borderRadius: Sizes.size16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Sizes.size12),
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              shadowColor: Colors.transparent,
                              color: Colors.blue[(index + 1) * 100],
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Card ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: RippleEffect(
                                      borderRadius: Sizes.size12,
                                      brightTone: true,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size12),
                                        ),
                                        child: Text(
                                          '${index + 1}/5 모두보기',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
