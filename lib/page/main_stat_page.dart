import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/page/async/async_stat_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_select_tab.dart';

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
