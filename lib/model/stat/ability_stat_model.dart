class AbilityStat {
  String? date;
  String? abilityGrade;
  List<AbilityInfo>? abilityInfo;
  int? remainFame;

  AbilityStat(
      {this.date, this.abilityGrade, this.abilityInfo, this.remainFame});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['ability_grade'] = this.abilityGrade;
    if (this.abilityInfo != null) {
      data['ability_info'] = this.abilityInfo!.map((v) => v.toJson()).toList();
    }
    data['remain_fame'] = this.remainFame;
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
