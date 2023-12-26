class VmatrixSkill {
  String? date;
  String? characterClass;
  List<CharacterVCoreEquipment>? characterVCoreEquipment;
  int? characterVMatrixRemainSlotUpgradePoint;

  VmatrixSkill(
      {this.date,
      this.characterClass,
      this.characterVCoreEquipment,
      this.characterVMatrixRemainSlotUpgradePoint});

  VmatrixSkill.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    if (json['character_v_core_equipment'] != null) {
      characterVCoreEquipment = <CharacterVCoreEquipment>[];
      json['character_v_core_equipment'].forEach((v) {
        characterVCoreEquipment!.add(new CharacterVCoreEquipment.fromJson(v));
      });
    }
    characterVMatrixRemainSlotUpgradePoint =
        json['character_v_matrix_remain_slot_upgrade_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    if (this.characterVCoreEquipment != null) {
      data['character_v_core_equipment'] =
          this.characterVCoreEquipment!.map((v) => v.toJson()).toList();
    }
    data['character_v_matrix_remain_slot_upgrade_point'] =
        this.characterVMatrixRemainSlotUpgradePoint;
    return data;
  }
}

class CharacterVCoreEquipment {
  String? slotId;
  int? slotLevel;
  String? vCoreName;
  String? vCoreType;
  int? vCoreLevel;
  String? vCoreSkill1;
  String? vCoreSkill2;
  String? vCoreSkill3;

  CharacterVCoreEquipment(
      {this.slotId,
      this.slotLevel,
      this.vCoreName,
      this.vCoreType,
      this.vCoreLevel,
      this.vCoreSkill1,
      this.vCoreSkill2,
      this.vCoreSkill3});

  CharacterVCoreEquipment.fromJson(Map<String, dynamic> json) {
    slotId = json['slot_id'];
    slotLevel = json['slot_level'];
    vCoreName = json['v_core_name'];
    vCoreType = json['v_core_type'];
    vCoreLevel = json['v_core_level'];
    vCoreSkill1 = json['v_core_skill_1'];
    vCoreSkill2 = json['v_core_skill_2'];
    vCoreSkill3 = json['v_core_skill_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_id'] = this.slotId;
    data['slot_level'] = this.slotLevel;
    data['v_core_name'] = this.vCoreName;
    data['v_core_type'] = this.vCoreType;
    data['v_core_level'] = this.vCoreLevel;
    data['v_core_skill_1'] = this.vCoreSkill1;
    data['v_core_skill_2'] = this.vCoreSkill2;
    data['v_core_skill_3'] = this.vCoreSkill3;
    return data;
  }
}
