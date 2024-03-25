import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/page/async/async_cash_page.dart';
import 'package:maplespy/page/async/async_item_page.dart';
import 'package:maplespy/page/async/async_pet_symbol_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_select_tab.dart';

class MainEquipmentPage extends ConsumerStatefulWidget {
  const MainEquipmentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainEquipmentPageState();
}

class _MainEquipmentPageState extends ConsumerState<MainEquipmentPage> {
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
    return MainContainer(
      isHome: false,
      body: Column(
        children: [
          DetailSelectTabWidget(
            tabList: StaticListConfig.detailEquipmentTabList,
            provider: equipmentSelectTabProvider,
            pageController: _pageController,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                ref.read(equipmentSelectTabProvider.notifier).update((state) =>
                    (StaticListConfig.detailEquipmentTabList[value]['name']));
              },
              children: const [
                AsyncItemPage(),
                AsyncCashPage(),
                AsyncPetSymbolPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
