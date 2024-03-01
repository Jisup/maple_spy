class AbilityStat {
  String? date;
  String? abilityGrade;
  List<AbilityInfo>? abilityInfo;
  int? remainFame;
  int? presetNo;
  AbilityPreset? abilityPreset1;
  AbilityPreset? abilityPreset2;
  AbilityPreset? abilityPreset3;

  AbilityStat(
      {this.date,
      this.abilityGrade,
      this.abilityInfo,
      this.remainFame,
      this.presetNo,
      this.abilityPreset1,
      this.abilityPreset2,
      this.abilityPreset3});

  AbilityStat.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    abilityGrade = json['ability_grade'];
    if (json['ability_info'] != null) {
      abilityInfo = <AbilityInfo>[];
      json['ability_info'].forEach((v) {
        abilityInfo!.add(new AbilityInfo.fromJson(v));
      });
    }
    remainFame = json['remain_fame'];
    presetNo = json['preset_no'];
    abilityPreset1 = json['ability_preset_1'] != null
        ? new AbilityPreset.fromJson(json['ability_preset_1'])
        : null;
    abilityPreset2 = json['ability_preset_2'] != null
        ? new AbilityPreset.fromJson(json['ability_preset_2'])
        : null;
    abilityPreset3 = json['ability_preset_3'] != null
        ? new AbilityPreset.fromJson(json['ability_preset_3'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['ability_grade'] = this.abilityGrade;
    if (this.abilityInfo != null) {
      data['ability_info'] = this.abilityInfo!.map((v) => v.toJson()).toList();
    }
    data['remain_fame'] = this.remainFame;
    data['preset_no'] = this.presetNo;
    if (this.abilityPreset1 != null) {
      data['ability_preset_1'] = this.abilityPreset1!.toJson();
    }
    if (this.abilityPreset2 != null) {
      data['ability_preset_2'] = this.abilityPreset2!.toJson();
    }
    if (this.abilityPreset3 != null) {
      data['ability_preset_3'] = this.abilityPreset3!.toJson();
    }
    return data;
  }
}

class AbilityInfo {
  String? abilityNo;
  String? abilityGrade;
  String? abilityValue;

  AbilityInfo({this.abilityNo, this.abilityGrade, this.abilityValue});

  AbilityInfo.fromJson(Map<String, dynamic> json) {
    abilityNo = json['ability_no'];
    abilityGrade = json['ability_grade'];
    abilityValue = json['ability_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ability_no'] = this.abilityNo;
    data['ability_grade'] = this.abilityGrade;
    data['ability_value'] = this.abilityValue;
    return data;
  }
}

class AbilityPreset {
  String? abilityPresetGrade;
  List<AbilityInfo>? abilityInfo;

  AbilityPreset({this.abilityPresetGrade, this.abilityInfo});

  AbilityPreset.fromJson(Map<String, dynamic> json) {
    abilityPresetGrade = json['ability_preset_grade'];
    if (json['ability_info'] != null) {
      abilityInfo = <AbilityInfo>[];
      json['ability_info'].forEach((v) {
        abilityInfo!.add(new AbilityInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ability_preset_grade'] = this.abilityPresetGrade;
    if (this.abilityInfo != null) {
      data['ability_info'] = this.abilityInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
