import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/page/async/async_hexa_skill_page.dart';
import 'package:maplespy/page/async/async_link_skill_page.dart';
import 'package:maplespy/page/async/async_v_skill_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_select_tab.dart';

class MainSkillPage extends ConsumerStatefulWidget {
  const MainSkillPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainSkillPageState();
}

class _MainSkillPageState extends ConsumerState<MainSkillPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    ref.read(skillControllerProvider.notifier).scrollController =
        ScrollController();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void deactivate() {
    ref.read(skillControllerProvider.notifier).scrollController.dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isHome: false,
      body: Column(
        children: [
          DetailSelectTabWidget(
            tabList: StaticListConfig.detailSkillTabList,
            provider: skillSelectTabProvider,
            pageController: _pageController,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                ref.read(skillSelectTabProvider.notifier).update((state) =>
                    (StaticListConfig.detailSkillTabList[value]['name']));
              },
              children: [
                AsyncHexaSkillPage(),
                AsyncVSkillPage(),
                AsyncLinkSkillPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
