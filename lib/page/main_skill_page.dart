import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/container/main_container.dart';
import 'package:maple_app/page/async/async_skill_page.dart';
import 'package:maple_app/widget/detail_page/detail_select_tab.dart';

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
