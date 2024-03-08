import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/page/async/async_union_artifact_page.dart';
import 'package:maplespy/page/async/async_union_main_character_page.dart';
import 'package:maplespy/page/async/async_union_raider_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_select_tab.dart';

class MainUnionPage extends ConsumerStatefulWidget {
  const MainUnionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainUnionPageState();
}

class _MainUnionPageState extends ConsumerState<MainUnionPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final characterName = ref.watch(characterNameProvider);
    final characterWorld = ref.watch(characterWorldProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(
              Icons.navigate_before_rounded,
              color: Colors.white,
              semanticLabel: '뒤로 가기 버튼',
            ),
          ),
          title: Text(
            '${characterName} (${characterWorld})',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colorScheme.onPrimary, fontFamily: 'Maplestory'),
          ),
        ),
        body: Column(
          children: [
            DetailSelectTabWidget(
              tabList: StaticListConfig.detailUnionTabList,
              provider: unionSelectTabProvider,
              pageController: _pageController,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  ref.read(unionSelectTabProvider.notifier).update((state) =>
                      (StaticListConfig.detailUnionTabList[value]['name']));
                },
                children: [
                  AsyncUnionRaiderPage(),
                  AsyncUnionArtifactPage(),
                  AsyncUnionMainCharacterPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
