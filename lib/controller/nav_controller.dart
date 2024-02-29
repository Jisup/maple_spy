import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/main_router.dart';

final navControllerProvider = AutoDisposeNotifierProvider(NavController.new);

class NavController extends AutoDisposeNotifier {
  @override
  build() {}

  void onClickNavTab({required String tab, required String path}) {
    final context = navigatorkey.currentContext!;
    switch (tab) {
      case '장비':
        ref.read(equipmentSelectTabProvider.notifier).update((state) => 'item');
        ref
            .read(equipmentCashPresetProvider.notifier)
            .update((state) => 'base');
        ref
            .read(equipmentSelectSymbolTabProvider.notifier)
            .update((state) => 'ARC');
        break;
      case '스탯':
        ref.read(statSelectTabProvider.notifier).update((state) => 'basic');
        ref.read(hyperStatPresetProvider.notifier).update((state) => 'preset1');
        break;
      case '스킬':
        ref.read(skillSelectTabProvider.notifier).update((state) => 'hexa');
        break;
    }
    context.go(path);
  }
}
