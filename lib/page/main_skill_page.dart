import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/page/async/async_skill_page.dart';
import 'package:maplespy/widget/detail_page/detail_select_tab.dart';

final skillSelectTabProvider = StateProvider((_) => 'hexa');

class MainSkillPage extends ConsumerWidget {
  const MainSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      isHome: false,
      body: Column(
        children: [
          DetailSelectTabWidget(
              tabList: StaticListConfig.detailSkillTabList,
              provider: skillSelectTabProvider),
          Expanded(child: AsyncSkillPage()),
        ],
      ),
    );
  }
}
