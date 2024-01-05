import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/main_stat_model.dart';
import 'package:maple_app/model/stat/ability_stat_model.dart';
import 'package:maple_app/model/stat/hexa_matrix_stat_model.dart';
import 'package:maple_app/model/stat/hyper_stat_model.dart';
import 'package:maple_app/model/stat/stat_model.dart';

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
    return StaticSwitchConfig.switchClassMainStat(basicStat.characterClass!) ==
        stat;
  }

  static String findStatValue(String statName) {
    return basicStat.finalStat!
            .singleWhere((element) => element.statName == statName,
                orElse: () => FinalStat())
            .statValue ??
        '';
  }
}
