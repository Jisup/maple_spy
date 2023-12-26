class HyperStat {
  String? date;
  String? characterClass;
  String? usePresetNo;
  int? useAvailableHyperStat;
  List<HyperStatPreset>? hyperStatPreset1;
  int? hyperStatPreset1RemainPoint;
  List<HyperStatPreset>? hyperStatPreset2;
  int? hyperStatPreset2RemainPoint;
  List<HyperStatPreset>? hyperStatPreset3;
  int? hyperStatPreset3RemainPoint;

  HyperStat(
      {this.date,
      this.characterClass,
      this.usePresetNo,
      this.useAvailableHyperStat,
      this.hyperStatPreset1,
      this.hyperStatPreset1RemainPoint,
      this.hyperStatPreset2,
      this.hyperStatPreset2RemainPoint,
      this.hyperStatPreset3,
      this.hyperStatPreset3RemainPoint});

  HyperStat.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    usePresetNo = json['use_preset_no'];
    useAvailableHyperStat = json['use_available_hyper_stat'];
    if (json['hyper_stat_preset_1'] != null) {
      hyperStatPreset1 = <HyperStatPreset>[];
      json['hyper_stat_preset_1'].forEach((v) {
        hyperStatPreset1!.add(new HyperStatPreset.fromJson(v));
      });
    }
    hyperStatPreset1RemainPoint = json['hyper_stat_preset_1_remain_point'];
    if (json['hyper_stat_preset_2'] != null) {
      hyperStatPreset2 = <HyperStatPreset>[];
      json['hyper_stat_preset_2'].forEach((v) {
        hyperStatPreset2!.add(new HyperStatPreset.fromJson(v));
      });
    }
    hyperStatPreset2RemainPoint = json['hyper_stat_preset_2_remain_point'];
    if (json['hyper_stat_preset_3'] != null) {
      hyperStatPreset3 = <HyperStatPreset>[];
      json['hyper_stat_preset_3'].forEach((v) {
        hyperStatPreset3!.add(new HyperStatPreset.fromJson(v));
      });
    }
    hyperStatPreset3RemainPoint = json['hyper_stat_preset_3_remain_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    data['use_preset_no'] = this.usePresetNo;
    data['use_available_hyper_stat'] = this.useAvailableHyperStat;
    if (this.hyperStatPreset1 != null) {
      data['hyper_stat_preset_1'] =
          this.hyperStatPreset1!.map((v) => v.toJson()).toList();
    }
    data['hyper_stat_preset_1_remain_point'] = this.hyperStatPreset1RemainPoint;
    if (this.hyperStatPreset2 != null) {
      data['hyper_stat_preset_2'] =
          this.hyperStatPreset2!.map((v) => v.toJson()).toList();
    }
    data['hyper_stat_preset_2_remain_point'] = this.hyperStatPreset2RemainPoint;
    if (this.hyperStatPreset3 != null) {
      data['hyper_stat_preset_3'] =
          this.hyperStatPreset3!.map((v) => v.toJson()).toList();
    }
    data['hyper_stat_preset_3_remain_point'] = this.hyperStatPreset3RemainPoint;
    return data;
  }
}

class HyperStatPreset {
  String? statType;
  int? statPoint;
  int? statLevel;
  String? statIncrease;

  HyperStatPreset(
      {this.statType, this.statPoint, this.statLevel, this.statIncrease});

  HyperStatPreset.fromJson(Map<String, dynamic> json) {
    statType = json['stat_type'];
    statPoint = json['stat_point'];
    statLevel = json['stat_level'];
    statIncrease = json['stat_increase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat_type'] = this.statType;
    data['stat_point'] = this.statPoint;
    data['stat_level'] = this.statLevel;
    data['stat_increase'] = this.statIncrease;
    return data;
  }
}
