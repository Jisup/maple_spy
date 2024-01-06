import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/main_stat_model.dart';
import 'package:maplespy/model/stat/ability_stat_model.dart';
import 'package:maplespy/model/stat/hexa_matrix_stat_model.dart';
import 'package:maplespy/model/stat/hyper_stat_model.dart';
import 'package:maplespy/model/stat/stat_model.dart';

class StatController {
  late MainStat mainStat;
  static late Stat basicStat;
  static late AbilityStat abilityStat;
  static late HyperStat hyperStat;
  static late HexaMatrixStat hexaMatrixStat;

  StatController({required this.mainStat}) {
    basicStat = mainStat.stat;
    abilityStat = mainStat.abilityStat;
    hyperStat = mainStat.hyperStat;
    hexaMatrixStat = mainStat.hexaMatrixStat;
  }

  static bool isEqualCharacterClass(String stat) {
    return StaticSwitchConfig.switchClassMainStat(
            className: basicStat.characterClass!) ==
        stat;
  }

  static String findStatValue(String statName) {
    return basicStat.finalStat!
            .singleWhere((element) => element.statName == statName,
                orElse: () => FinalStat())
            .statValue ??
        '';
  }

  static AbilityInfo findAbilityInfo(int no) {
    return abilityStat.abilityInfo!.singleWhere(
        (element) => element.abilityNo == no.toString(),
        orElse: () => AbilityInfo());
  }

  static List<HyperStatPreset>? hyperStatPresetInfo(String preset) {
    switch (preset) {
      case 'preset1':
        return hyperStat.hyperStatPreset1;
      case 'preset2':
        return hyperStat.hyperStatPreset2;
      case 'preset3':
        return hyperStat.hyperStatPreset3;
      default:
        return [];
    }
  }
}
