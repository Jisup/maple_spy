import 'package:maple_app/model/stat/ability_stat_model.dart';
import 'package:maple_app/model/stat/hexamatrix_stat_model.dart';
import 'package:maple_app/model/stat/hyper_stat_model.dart';
import 'package:maple_app/model/stat/stat_model.dart';

class MainStat {
  Stat stat;
  HyperStat hyper;
  AbilityStat ability;
  HexamatrixStat hexamatrix;

  MainStat(
      {required this.stat,
      required this.hyper,
      required this.ability,
      required this.hexamatrix});

  MainStat copyWith(
          {Stat? stat,
          HyperStat? hyper,
          AbilityStat? ability,
          HexamatrixStat? hexamatrix}) =>
      MainStat(
          stat: stat ?? this.stat,
          hyper: hyper ?? this.hyper,
          ability: ability ?? this.ability,
          hexamatrix: hexamatrix ?? this.hexamatrix);
}
