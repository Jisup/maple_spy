import 'package:maplespy/config/static_switch_config.dart';

class UnionArtifact {
  String? date;
  List<UnionArtifactEffect>? unionArtifactEffect;
  List<UnionArtifactCrystal>? unionArtifactCrystal;
  int? unionArtifactRemainAp;

  UnionArtifact(
      {this.date,
      this.unionArtifactEffect,
      this.unionArtifactCrystal,
      this.unionArtifactRemainAp});

  UnionArtifact.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['union_artifact_effect'] != null) {
      unionArtifactEffect = <UnionArtifactEffect>[];
      json['union_artifact_effect'].forEach((v) {
        unionArtifactEffect!.add(new UnionArtifactEffect.fromJson(v));
      });
    }

    if (unionArtifactEffect != null && unionArtifactEffect!.isNotEmpty) {
      unionArtifactEffect!.sort((a, b) {
        var a_result = StaticSwitchConfig.switchUnionStat(stat: a.name!);
        var b_result = StaticSwitchConfig.switchUnionStat(stat: b.name!);

        if (a_result == b_result) {
          return a.name!.compareTo(b.name!);
        }
        return a_result - b_result;
      });
    }

    if (json['union_artifact_crystal'] != null) {
      unionArtifactCrystal = <UnionArtifactCrystal>[];
      json['union_artifact_crystal'].forEach((v) {
        unionArtifactCrystal!.add(new UnionArtifactCrystal.fromJson(v));
      });
    }
    unionArtifactRemainAp = json['union_artifact_remain_ap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.unionArtifactEffect != null) {
      data['union_artifact_effect'] =
          this.unionArtifactEffect!.map((v) => v.toJson()).toList();
    }
    if (this.unionArtifactCrystal != null) {
      data['union_artifact_crystal'] =
          this.unionArtifactCrystal!.map((v) => v.toJson()).toList();
    }
    data['union_artifact_remain_ap'] = this.unionArtifactRemainAp;
    return data;
  }
}

class UnionArtifactEffect {
  String? name;
  int? level;

  UnionArtifactEffect({this.name, this.level});

  UnionArtifactEffect.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    level = json['level'];

    if (name != null) {
      name = name!.replaceAll(' 증가, ', ' 증가\n').replaceAll(', ', ' 증가\n');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['level'] = this.level;
    return data;
  }
}

class UnionArtifactCrystal {
  String? name;
  String? validityFlag;
  String? dateExpire;
  int? level;
  String? crystalOptionName1;
  String? crystalOptionName2;
  String? crystalOptionName3;

  UnionArtifactCrystal(
      {this.name,
      this.validityFlag,
      this.dateExpire,
      this.level,
      this.crystalOptionName1,
      this.crystalOptionName2,
      this.crystalOptionName3});

  UnionArtifactCrystal.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    if (name != null) {
      name = name!.split(' ').last;
    }

    validityFlag = json['validity_flag'];
    dateExpire = json['date_expire'];
    level = json['level'];
    crystalOptionName1 = json['crystal_option_name_1'];
    crystalOptionName2 = json['crystal_option_name_2'];
    crystalOptionName3 = json['crystal_option_name_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['validity_flag'] = this.validityFlag;
    data['date_expire'] = this.dateExpire;
    data['level'] = this.level;
    data['crystal_option_name_1'] = this.crystalOptionName1;
    data['crystal_option_name_2'] = this.crystalOptionName2;
    data['crystal_option_name_3'] = this.crystalOptionName3;
    return data;
  }
}
