import 'package:maple_app/config/static_switch_config.dart';

class HexaMatrixStat {
  String? date;
  String? characterClass;
  List<CharacterHexaStatCore>? characterHexaStatCore;
  List<PresetHexaStatCore>? presetHexaStatCore;

  HexaMatrixStat(
      {this.date,
      this.characterClass,
      this.characterHexaStatCore,
      this.presetHexaStatCore});

  HexaMatrixStat.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    if (json['character_hexa_stat_core'] != null) {
      characterHexaStatCore = <CharacterHexaStatCore>[];
      json['character_hexa_stat_core'].forEach((v) {
        characterHexaStatCore!.add(new CharacterHexaStatCore.fromJson(v));
      });
    }
    if (json['preset_hexa_stat_core'] != null) {
      presetHexaStatCore = <PresetHexaStatCore>[];
      json['preset_hexa_stat_core'].forEach((v) {
        presetHexaStatCore!.add(new PresetHexaStatCore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    if (this.characterHexaStatCore != null) {
      data['character_hexa_stat_core'] =
          this.characterHexaStatCore!.map((v) => v.toJson()).toList();
    }
    if (this.presetHexaStatCore != null) {
      data['preset_hexa_stat_core'] =
          this.presetHexaStatCore!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CharacterHexaStatCore {
  String? slotId;
  String? mainStatName;
  String? subStatName1;
  String? subStatName2;
  int? mainStatLevel;
  int? subStatLevel1;
  int? subStatLevel2;
  double? mainStatValue;
  double? subStatValue1;
  double? subStatValue2;
  int? statGrade;

  CharacterHexaStatCore(
      {this.slotId,
      this.mainStatName,
      this.subStatName1,
      this.subStatName2,
      this.mainStatLevel,
      this.subStatLevel1,
      this.subStatLevel2,
      this.statGrade});

  CharacterHexaStatCore.fromJson(Map<String, dynamic> json) {
    slotId = json['slot_id'];
    mainStatName = json['main_stat_name'];
    subStatName1 = json['sub_stat_name_1'];
    subStatName2 = json['sub_stat_name_2'];
    mainStatLevel = json['main_stat_level'];
    subStatLevel1 = json['sub_stat_level_1'];
    subStatLevel2 = json['sub_stat_level_2'];
    statGrade = json['stat_grade'];

    mainStatName = mainStatName?.replaceAll(' 증가', '');
    subStatName1 = subStatName1?.replaceAll(' 증가', '');
    subStatName2 = subStatName2?.replaceAll(' 증가', '');

    mainStatValue = StaticSwitchConfig.switchHexaStatMainValue(
        name: mainStatName ?? '', level: mainStatLevel ?? 0);
    subStatValue1 = StaticSwitchConfig.switchHexaStatAdditionalValue(
        name: subStatName1 ?? '', level: subStatLevel1 ?? 0);
    subStatValue2 = StaticSwitchConfig.switchHexaStatAdditionalValue(
        name: subStatName2 ?? '', level: subStatLevel2 ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_id'] = this.slotId;
    data['main_stat_name'] = this.mainStatName;
    data['sub_stat_name_1'] = this.subStatName1;
    data['sub_stat_name_2'] = this.subStatName2;
    data['main_stat_level'] = this.mainStatLevel;
    data['sub_stat_level_1'] = this.subStatLevel1;
    data['sub_stat_level_2'] = this.subStatLevel2;
    data['stat_grade'] = this.statGrade;
    return data;
  }
}

class PresetHexaStatCore {
  String? slotId;
  String? mainStatName;
  String? subStatName1;
  String? subStatName2;
  int? mainStatLevel;
  int? subStatLevel1;
  int? subStatLevel2;
  int? statGrade;

  PresetHexaStatCore(
      {this.slotId,
      this.mainStatName,
      this.subStatName1,
      this.subStatName2,
      this.mainStatLevel,
      this.subStatLevel1,
      this.subStatLevel2,
      this.statGrade});

  PresetHexaStatCore.fromJson(Map<String, dynamic> json) {
    slotId = json['slot_id'];
    mainStatName = json['main_stat_name'];
    subStatName1 = json['sub_stat_name_1'];
    subStatName2 = json['sub_stat_name_2'];
    mainStatLevel = json['main_stat_level'];
    subStatLevel1 = json['sub_stat_level_1'];
    subStatLevel2 = json['sub_stat_level_2'];
    statGrade = json['stat_grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_id'] = this.slotId;
    data['main_stat_name'] = this.mainStatName;
    data['sub_stat_name_1'] = this.subStatName1;
    data['sub_stat_name_2'] = this.subStatName2;
    data['main_stat_level'] = this.mainStatLevel;
    data['sub_stat_level_1'] = this.subStatLevel1;
    data['sub_stat_level_2'] = this.subStatLevel2;
    data['stat_grade'] = this.statGrade;
    return data;
  }
}
