import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/equipment_cash_notifier.dart';
import 'package:maplespy/provider/equipment_item_notifier.dart';
import 'package:maplespy/provider/equipment_pet_symbol_notifier.dart';
import 'package:maplespy/provider/skill_notifier.dart';
import 'package:maplespy/provider/stat_ablity_hyper_notifier.dart';
import 'package:maplespy/provider/stat_basic_notifier.dart';
import 'package:maplespy/provider/stat_hexa_notifier.dart';
import 'package:maplespy/util/main_router.dart';

final navControllerProvider = AutoDisposeNotifierProvider(NavController.new);

class NavController extends AutoDisposeNotifier {
  @override
  build() {}

  void onClickNavTab({required String tab, required String path}) {
    final context = navigatorkey.currentContext!;

    /**----- 정보 업데이트 */
    switch (tab) {
      case '캐릭터':
        ref.read(asyncCharacterProvider.notifier).getNewCharacter();
        break;
      case '장비':
        ref.read(asyncEquipmentItemProvider.notifier).getNewItemEquipment();
        ref.read(asyncEquipmentCashProvider.notifier).getNewCashEquipment();
        ref.read(asyncEquipmentPetSymbolProvider.notifier).getNewPetSymbol();
        break;
      case '스탯':
        ref.read(asyncStatBasicProvider.notifier).getNewBasicStat();
        ref.read(asyncStatHexaProvider.notifier).getNewHexaStat();
        ref
            .read(asyncStatAbilityHyperProvider.notifier)
            .getNewAbilityHyperStat();
        break;
      case '스킬':
        ref.read(asyncSkillProvider.notifier).getNewSkill();
        break;
    }

    /**----- 선택 탭 초기화 */
    switch (tab) {
      case '캐릭터':
        break;
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
