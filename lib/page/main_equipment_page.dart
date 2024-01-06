import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/async/async_cash_page.dart';
import 'package:maplespy/page/async/async_item_page.dart';
import 'package:maplespy/page/async/async_pet_symbol_page.dart';
import 'package:maplespy/widget/detail_page/detail_select_tab.dart';

final equipmentSelectTabProvider = StateProvider((_) => 'item');

class MainEquipmentPage extends ConsumerWidget {
  const MainEquipmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectTab = ref.watch(equipmentSelectTabProvider);
    return MainContainer(
      isHome: false,
      body: Column(
        children: [
          DetailSelectTabWidget(
            tabList: StaticListConfig.detailEquipmentTabList,
            provider: equipmentSelectTabProvider,
          ),
          Expanded(
            child: switch (selectTab) {
              'item' => AsyncItemPage(),
              'cash' => AsyncCashPage(),
              'pet/symbol' => AsyncPetSymbolPage(),
              _ => MainErrorPage(message: 'equipment select tab move error'),
            },
          ),
        ],
      ),
    );
  }
}
