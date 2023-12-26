class PetItem {
  String? date;
  String? pet1Name;
  String? pet1Nickname;
  String? pet1Icon;
  String? pet1Description;
  Pet1Equipment? pet1Equipment;
  Pet1AutoSkill? pet1AutoSkill;
  String? pet1PetType;
  List<String>? pet1Skill;
  String? pet1DateExpire;
  String? pet2Name;
  String? pet2Nickname;
  String? pet2Icon;
  String? pet2Description;
  Pet1Equipment? pet2Equipment;
  Pet1AutoSkill? pet2AutoSkill;
  String? pet2PetType;
  List<String>? pet2Skill;
  String? pet2DateExpire;
  String? pet3Name;
  String? pet3Nickname;
  String? pet3Icon;
  String? pet3Description;
  Pet1Equipment? pet3Equipment;
  Pet1AutoSkill? pet3AutoSkill;
  String? pet3PetType;
  List<String>? pet3Skill;
  String? pet3DateExpire;

  PetItem(
      {this.date,
      this.pet1Name,
      this.pet1Nickname,
      this.pet1Icon,
      this.pet1Description,
      this.pet1Equipment,
      this.pet1AutoSkill,
      this.pet1PetType,
      this.pet1Skill,
      this.pet1DateExpire,
      this.pet2Name,
      this.pet2Nickname,
      this.pet2Icon,
      this.pet2Description,
      this.pet2Equipment,
      this.pet2AutoSkill,
      this.pet2PetType,
      this.pet2Skill,
      this.pet2DateExpire,
      this.pet3Name,
      this.pet3Nickname,
      this.pet3Icon,
      this.pet3Description,
      this.pet3Equipment,
      this.pet3AutoSkill,
      this.pet3PetType,
      this.pet3Skill,
      this.pet3DateExpire});

  PetItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    pet1Name = json['pet_1_name'];
    pet1Nickname = json['pet_1_nickname'];
    pet1Icon = json['pet_1_icon'];
    pet1Description = json['pet_1_description'];
    pet1Equipment = json['pet_1_equipment'] != null
        ? new Pet1Equipment.fromJson(json['pet_1_equipment'])
        : null;
    pet1AutoSkill = json['pet_1_auto_skill'] != null
        ? new Pet1AutoSkill.fromJson(json['pet_1_auto_skill'])
        : null;
    pet1PetType = json['pet_1_pet_type'];
    pet1Skill = json['pet_1_skill'].cast<String>();
    pet1DateExpire = json['pet_1_date_expire'];
    pet2Name = json['pet_2_name'];
    pet2Nickname = json['pet_2_nickname'];
    pet2Icon = json['pet_2_icon'];
    pet2Description = json['pet_2_description'];
    pet2Equipment = json['pet_2_equipment'] != null
        ? new Pet1Equipment.fromJson(json['pet_2_equipment'])
        : null;
    pet2AutoSkill = json['pet_2_auto_skill'] != null
        ? new Pet1AutoSkill.fromJson(json['pet_2_auto_skill'])
        : null;
    pet2PetType = json['pet_2_pet_type'];
    pet2Skill = json['pet_2_skill'].cast<String>();
    pet2DateExpire = json['pet_2_date_expire'];
    pet3Name = json['pet_3_name'];
    pet3Nickname = json['pet_3_nickname'];
    pet3Icon = json['pet_3_icon'];
    pet3Description = json['pet_3_description'];
    pet3Equipment = json['pet_3_equipment'] != null
        ? new Pet1Equipment.fromJson(json['pet_3_equipment'])
        : null;
    pet3AutoSkill = json['pet_3_auto_skill'] != null
        ? new Pet1AutoSkill.fromJson(json['pet_3_auto_skill'])
        : null;
    pet3PetType = json['pet_3_pet_type'];
    pet3Skill = json['pet_3_skill'].cast<String>();
    pet3DateExpire = json['pet_3_date_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['pet_1_name'] = this.pet1Name;
    data['pet_1_nickname'] = this.pet1Nickname;
    data['pet_1_icon'] = this.pet1Icon;
    data['pet_1_description'] = this.pet1Description;
    if (this.pet1Equipment != null) {
      data['pet_1_equipment'] = this.pet1Equipment!.toJson();
    }
    if (this.pet1AutoSkill != null) {
      data['pet_1_auto_skill'] = this.pet1AutoSkill!.toJson();
    }
    data['pet_1_pet_type'] = this.pet1PetType;
    data['pet_1_skill'] = this.pet1Skill;
    data['pet_1_date_expire'] = this.pet1DateExpire;
    data['pet_2_name'] = this.pet2Name;
    data['pet_2_nickname'] = this.pet2Nickname;
    data['pet_2_icon'] = this.pet2Icon;
    data['pet_2_description'] = this.pet2Description;
    if (this.pet2Equipment != null) {
      data['pet_2_equipment'] = this.pet2Equipment!.toJson();
    }
    if (this.pet2AutoSkill != null) {
      data['pet_2_auto_skill'] = this.pet2AutoSkill!.toJson();
    }
    data['pet_2_pet_type'] = this.pet2PetType;
    data['pet_2_skill'] = this.pet2Skill;
    data['pet_2_date_expire'] = this.pet2DateExpire;
    data['pet_3_name'] = this.pet3Name;
    data['pet_3_nickname'] = this.pet3Nickname;
    data['pet_3_icon'] = this.pet3Icon;
    data['pet_3_description'] = this.pet3Description;
    if (this.pet3Equipment != null) {
      data['pet_3_equipment'] = this.pet3Equipment!.toJson();
    }
    if (this.pet3AutoSkill != null) {
      data['pet_3_auto_skill'] = this.pet3AutoSkill!.toJson();
    }
    data['pet_3_pet_type'] = this.pet3PetType;
    data['pet_3_skill'] = this.pet3Skill;
    data['pet_3_date_expire'] = this.pet3DateExpire;
    return data;
  }
}

class Pet1Equipment {
  String? itemName;
  String? itemIcon;
  String? itemDescription;
  List<ItemOption>? itemOption;
  int? scrollUpgrade;
  int? scrollUpgradeable;

  Pet1Equipment(
      {this.itemName,
      this.itemIcon,
      this.itemDescription,
      this.itemOption,
      this.scrollUpgrade,
      this.scrollUpgradeable});

  Pet1Equipment.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemIcon = json['item_icon'];
    itemDescription = json['item_description'];
    if (json['item_option'] != null) {
      itemOption = <ItemOption>[];
      json['item_option'].forEach((v) {
        itemOption!.add(new ItemOption.fromJson(v));
      });
    }
    scrollUpgrade = json['scroll_upgrade'];
    scrollUpgradeable = json['scroll_upgradeable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_icon'] = this.itemIcon;
    data['item_description'] = this.itemDescription;
    if (this.itemOption != null) {
      data['item_option'] = this.itemOption!.map((v) => v.toJson()).toList();
    }
    data['scroll_upgrade'] = this.scrollUpgrade;
    data['scroll_upgradeable'] = this.scrollUpgradeable;
    return data;
  }
}

class ItemOption {
  String? optionType;
  String? optionValue;

  ItemOption({this.optionType, this.optionValue});

  ItemOption.fromJson(Map<String, dynamic> json) {
    optionType = json['option_type'];
    optionValue = json['option_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_type'] = this.optionType;
    data['option_value'] = this.optionValue;
    return data;
  }
}

class Pet1AutoSkill {
  String? skill1;
  String? skill1Icon;
  String? skill2;
  String? skill2Icon;

  Pet1AutoSkill({this.skill1, this.skill1Icon, this.skill2, this.skill2Icon});

  Pet1AutoSkill.fromJson(Map<String, dynamic> json) {
    skill1 = json['skill_1'];
    skill1Icon = json['skill_1_icon'];
    skill2 = json['skill_2'];
    skill2Icon = json['skill_2_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill_1'] = this.skill1;
    data['skill_1_icon'] = this.skill1Icon;
    data['skill_2'] = this.skill2;
    data['skill_2_icon'] = this.skill2Icon;
    return data;
  }
}
