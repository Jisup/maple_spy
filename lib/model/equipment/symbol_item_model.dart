class SymbolItem {
  String? date;
  String? characterClass;
  List<Symbol>? symbol;

  SymbolItem({this.date, this.characterClass, this.symbol});

  SymbolItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    if (json['symbol'] != null) {
      symbol = <Symbol>[];
      json['symbol'].forEach((v) {
        symbol!.add(new Symbol.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    if (this.symbol != null) {
      data['symbol'] = this.symbol!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symbol {
  String? symbolName;
  String? symbolIcon;
  String? symbolDescription;
  String? symbolForce;
  int? symbolLevel;
  String? symbolStr;
  String? symbolDex;
  String? symbolInt;
  String? symbolLuk;
  String? symbolHp;
  int? symbolGrowthCount;
  int? symbolRequireGrowthCount;

  Symbol(
      {this.symbolName,
      this.symbolIcon,
      this.symbolDescription,
      this.symbolForce,
      this.symbolLevel,
      this.symbolStr,
      this.symbolDex,
      this.symbolInt,
      this.symbolLuk,
      this.symbolHp,
      this.symbolGrowthCount,
      this.symbolRequireGrowthCount});

  Symbol.fromJson(Map<String, dynamic> json) {
    symbolName = json['symbol_name'];
    symbolIcon = json['symbol_icon'];
    symbolDescription = json['symbol_description'];
    symbolForce = json['symbol_force'];
    symbolLevel = json['symbol_level'];
    symbolStr = json['symbol_str'];
    symbolDex = json['symbol_dex'];
    symbolInt = json['symbol_int'];
    symbolLuk = json['symbol_luk'];
    symbolHp = json['symbol_hp'];
    symbolGrowthCount = json['symbol_growth_count'];
    symbolRequireGrowthCount = json['symbol_require_growth_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol_name'] = this.symbolName;
    data['symbol_icon'] = this.symbolIcon;
    data['symbol_description'] = this.symbolDescription;
    data['symbol_force'] = this.symbolForce;
    data['symbol_level'] = this.symbolLevel;
    data['symbol_str'] = this.symbolStr;
    data['symbol_dex'] = this.symbolDex;
    data['symbol_int'] = this.symbolInt;
    data['symbol_luk'] = this.symbolLuk;
    data['symbol_hp'] = this.symbolHp;
    data['symbol_growth_count'] = this.symbolGrowthCount;
    data['symbol_require_growth_count'] = this.symbolRequireGrowthCount;
    return data;
  }
}
