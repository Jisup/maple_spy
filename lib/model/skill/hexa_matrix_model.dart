class HexaMatrix {
  String? date;
  List<CharacterHexaCoreEquipment>? characterHexaCoreEquipment;

  HexaMatrix({this.date, this.characterHexaCoreEquipment});

  HexaMatrix.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['character_hexa_core_equipment'] != null) {
      characterHexaCoreEquipment = <CharacterHexaCoreEquipment>[];
      json['character_hexa_core_equipment'].forEach((v) {
        characterHexaCoreEquipment!
            .add(new CharacterHexaCoreEquipment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.characterHexaCoreEquipment != null) {
      data['character_hexa_core_equipment'] =
          this.characterHexaCoreEquipment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CharacterHexaCoreEquipment {
  String? hexaCoreName;
  int? hexaCoreLevel;
  String? hexaCoreType;
  List<LinkedSkill>? linkedSkill;

  CharacterHexaCoreEquipment(
      {this.hexaCoreName,
      this.hexaCoreLevel,
      this.hexaCoreType,
      this.linkedSkill});

  CharacterHexaCoreEquipment.fromJson(Map<String, dynamic> json) {
    hexaCoreName = json['hexa_core_name'];
    hexaCoreLevel = json['hexa_core_level'];
    hexaCoreType = json['hexa_core_type'];
    if (json['linked_skill'] != null) {
      linkedSkill = <LinkedSkill>[];
      json['linked_skill'].forEach((v) {
        linkedSkill!.add(new LinkedSkill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hexa_core_name'] = this.hexaCoreName;
    data['hexa_core_level'] = this.hexaCoreLevel;
    data['hexa_core_type'] = this.hexaCoreType;
    if (this.linkedSkill != null) {
      data['linked_skill'] = this.linkedSkill!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LinkedSkill {
  String? hexaSkillId;

  LinkedSkill({this.hexaSkillId});

  LinkedSkill.fromJson(Map<String, dynamic> json) {
    hexaSkillId = json['hexa_skill_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hexa_skill_id'] = this.hexaSkillId;
    return data;
  }
}
