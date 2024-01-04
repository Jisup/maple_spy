import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/container/main_container.dart';
import 'package:maple_app/page/async/async_stat_page.dart';
import 'package:maple_app/widget/detail_page/detail_select_tab.dart';

final statSelectTabProvider = StateProvider((_) => 'basic');

class MainStatPage extends ConsumerWidget {
  const MainStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      isHome: false,
      body: Column(
        children: [
          DetailSelectTabWidget(
              tabList: StaticListConfig.detailStatTabList,
              provider: statSelectTabProvider),
          Expanded(
            child: AsyncStatPage(),
          ),
        ],
      ),
    );
  }
}
