import 'package:maple_app/model/equipment/symbol_item_model.dart';

class SymbolDetail {
  List<Symbol> arcane = [];
  SymbolStat arcaneStat = SymbolStat();
  List<Symbol> authentic = [];
  SymbolStat authenticStat = SymbolStat();

  SymbolDetail({required List<Symbol>? symbol}) {
    arcane = symbol!
        .where((element) => element.symbolName!.contains('아케인심볼'))
        .toList();
    for (var element in arcane) {
      arcaneStat.force += int.parse(element.symbolForce!);
      arcaneStat.statStr += int.parse(element.symbolStr!);
      arcaneStat.statDex += int.parse(element.symbolDex!);
      arcaneStat.statInt += int.parse(element.symbolInt!);
      arcaneStat.statLuk += int.parse(element.symbolLuk!);
    }
    arcaneStat.statSum();

    authentic = symbol
        .where((element) => element.symbolName!.contains('어센틱심볼'))
        .toList();
    for (var element in authentic) {
      authenticStat.force += int.parse(element.symbolForce!);
      authenticStat.statStr += int.parse(element.symbolStr!);
      authenticStat.statDex += int.parse(element.symbolDex!);
      authenticStat.statInt += int.parse(element.symbolInt!);
      authenticStat.statLuk += int.parse(element.symbolLuk!);
    }
    authenticStat.statSum();
  }
}

class SymbolStat {
  int force = 0;
  int statMain = 0;
  int statStr = 0;
  int statDex = 0;
  int statInt = 0;
  int statLuk = 0;

  void statSum() {
    if (statStr != 0 && statDex != 0 && statLuk != 0) {
      statMain += statLuk;
    } else
      statMain += statStr + statDex + statInt + statLuk;
  }
}
