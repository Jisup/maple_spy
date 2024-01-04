import 'package:maple_app/model/stat/ability_stat_model.dart';
import 'package:maple_app/model/stat/hexa_matrix_stat_model.dart';
import 'package:maple_app/model/stat/hyper_stat_model.dart';
import 'package:maple_app/model/stat/stat_model.dart';

class MainStat {
  Stat stat;
  HyperStat hyperStat;
  AbilityStat abilityStat;
  HexaMatrixStat hexaMatrixStat;

  MainStat(
      {required this.stat,
      required this.hyperStat,
      required this.abilityStat,
      required this.hexaMatrixStat});
}
