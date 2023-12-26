class Item {
  String? date;
  String? characterGender;
  String? characterClass;
  List<ItemEquipment>? itemEquipment;
  Title? title;
  List<DragonEquipment>? dragonEquipment;
  List<MechanicEquipment>? mechanicEquipment;

  Item(
      {this.date,
      this.characterGender,
      this.characterClass,
      this.itemEquipment,
      this.title,
      this.dragonEquipment,
      this.mechanicEquipment});

  Item.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterGender = json['character_gender'];
    characterClass = json['character_class'];
    if (json['item_equipment'] != null) {
      itemEquipment = <ItemEquipment>[];
      json['item_equipment'].forEach((v) {
        itemEquipment!.add(new ItemEquipment.fromJson(v));
      });
    }
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    if (json['dragon_equipment'] != null) {
      dragonEquipment = <DragonEquipment>[];
      json['dragon_equipment'].forEach((v) {
        dragonEquipment!.add(new DragonEquipment.fromJson(v));
      });
    }
    if (json['mechanic_equipment'] != null) {
      mechanicEquipment = <MechanicEquipment>[];
      json['mechanic_equipment'].forEach((v) {
        mechanicEquipment!.add(new MechanicEquipment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_gender'] = this.characterGender;
    data['character_class'] = this.characterClass;
    if (this.itemEquipment != null) {
      data['item_equipment'] =
          this.itemEquipment!.map((v) => v.toJson()).toList();
    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.dragonEquipment != null) {
      data['dragon_equipment'] =
          this.dragonEquipment!.map((v) => v.toJson()).toList();
    }
    if (this.mechanicEquipment != null) {
      data['mechanic_equipment'] =
          this.mechanicEquipment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemEquipment {
  String? itemEquipmentPart;
  String? equipmentSlot;
  String? itemName;
  String? itemIcon;
  String? itemDescription;
  String? itemShapeName;
  String? itemShapeIcon;
  String? gender;
  ItemTotalOption? itemTotalOption;
  ItemBaseOption? itemBaseOption;
  String? potentialOptionGrade;
  String? additionalPotentialOptionGrade;
  String? potentialOption1;
  String? potentialOption2;
  String? potentialOption3;
  String? additionalPotentialOption1;
  String? additionalPotentialOption2;
  String? additionalPotentialOption3;
  int? equipmentLevelIncrease;
  ItemExceptionalOption? itemExceptionalOption;
  ItemAddOption? itemAddOption;
  int? growthExp;
  int? growthLevel;
  String? scrollUpgrade;
  String? cuttableCount;
  String? goldenHammerFlag;
  String? scrollResilienceCount;
  String? scrollUpgradeableCount;
  String? soulName;
  String? soulOption;
  ItemEtcOption? itemEtcOption;
  String? starforce;
  String? starforceScrollFlag;
  ItemEtcOption? itemStarforceOption;
  int? specialRingLevel;
  String? dateExpire;

  ItemEquipment(
      {this.itemEquipmentPart,
      this.equipmentSlot,
      this.itemName,
      this.itemIcon,
      this.itemDescription,
      this.itemShapeName,
      this.itemShapeIcon,
      this.gender,
      this.itemTotalOption,
      this.itemBaseOption,
      this.potentialOptionGrade,
      this.additionalPotentialOptionGrade,
      this.potentialOption1,
      this.potentialOption2,
      this.potentialOption3,
      this.additionalPotentialOption1,
      this.additionalPotentialOption2,
      this.additionalPotentialOption3,
      this.equipmentLevelIncrease,
      this.itemExceptionalOption,
      this.itemAddOption,
      this.growthExp,
      this.growthLevel,
      this.scrollUpgrade,
      this.cuttableCount,
      this.goldenHammerFlag,
      this.scrollResilienceCount,
      this.scrollUpgradeableCount,
      this.soulName,
      this.soulOption,
      this.itemEtcOption,
      this.starforce,
      this.starforceScrollFlag,
      this.itemStarforceOption,
      this.specialRingLevel,
      this.dateExpire});

  ItemEquipment.fromJson(Map<String, dynamic> json) {
    itemEquipmentPart = json['item_equipment_part'];
    equipmentSlot = json['equipment_slot'];
    itemName = json['item_name'];
    itemIcon = json['item_icon'];
    itemDescription = json['item_description'];
    itemShapeName = json['item_shape_name'];
    itemShapeIcon = json['item_shape_icon'];
    gender = json['gender'];
    itemTotalOption = json['item_total_option'] != null
        ? new ItemTotalOption.fromJson(json['item_total_option'])
        : null;
    itemBaseOption = json['item_base_option'] != null
        ? new ItemBaseOption.fromJson(json['item_base_option'])
        : null;
    potentialOptionGrade = json['potential_option_grade'];
    additionalPotentialOptionGrade = json['additional_potential_option_grade'];
    potentialOption1 = json['potential_option_1'];
    potentialOption2 = json['potential_option_2'];
    potentialOption3 = json['potential_option_3'];
    additionalPotentialOption1 = json['additional_potential_option_1'];
    additionalPotentialOption2 = json['additional_potential_option_2'];
    additionalPotentialOption3 = json['additional_potential_option_3'];
    equipmentLevelIncrease = json['equipment_level_increase'];
    itemExceptionalOption = json['item_exceptional_option'] != null
        ? new ItemExceptionalOption.fromJson(json['item_exceptional_option'])
        : null;
    itemAddOption = json['item_add_option'] != null
        ? new ItemAddOption.fromJson(json['item_add_option'])
        : null;
    growthExp = json['growth_exp'];
    growthLevel = json['growth_level'];
    scrollUpgrade = json['scroll_upgrade'];
    cuttableCount = json['cuttable_count'];
    goldenHammerFlag = json['golden_hammer_flag'];
    scrollResilienceCount = json['scroll_resilience_count'];
    scrollUpgradeableCount = json['scroll_upgradeable_count'];
    soulName = json['soul_name'];
    soulOption = json['soul_option'];
    itemEtcOption = json['item_etc_option'] != null
        ? new ItemEtcOption.fromJson(json['item_etc_option'])
        : null;
    starforce = json['starforce'];
    starforceScrollFlag = json['starforce_scroll_flag'];
    itemStarforceOption = json['item_starforce_option'] != null
        ? new ItemEtcOption.fromJson(json['item_starforce_option'])
        : null;
    specialRingLevel = json['special_ring_level'];
    dateExpire = json['date_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_equipment_part'] = this.itemEquipmentPart;
    data['equipment_slot'] = this.equipmentSlot;
    data['item_name'] = this.itemName;
    data['item_icon'] = this.itemIcon;
    data['item_description'] = this.itemDescription;
    data['item_shape_name'] = this.itemShapeName;
    data['item_shape_icon'] = this.itemShapeIcon;
    data['gender'] = this.gender;
    if (this.itemTotalOption != null) {
      data['item_total_option'] = this.itemTotalOption!.toJson();
    }
    if (this.itemBaseOption != null) {
      data['item_base_option'] = this.itemBaseOption!.toJson();
    }
    data['potential_option_grade'] = this.potentialOptionGrade;
    data['additional_potential_option_grade'] =
        this.additionalPotentialOptionGrade;
    data['potential_option_1'] = this.potentialOption1;
    data['potential_option_2'] = this.potentialOption2;
    data['potential_option_3'] = this.potentialOption3;
    data['additional_potential_option_1'] = this.additionalPotentialOption1;
    data['additional_potential_option_2'] = this.additionalPotentialOption2;
    data['additional_potential_option_3'] = this.additionalPotentialOption3;
    data['equipment_level_increase'] = this.equipmentLevelIncrease;
    if (this.itemExceptionalOption != null) {
      data['item_exceptional_option'] = this.itemExceptionalOption!.toJson();
    }
    if (this.itemAddOption != null) {
      data['item_add_option'] = this.itemAddOption!.toJson();
    }
    data['growth_exp'] = this.growthExp;
    data['growth_level'] = this.growthLevel;
    data['scroll_upgrade'] = this.scrollUpgrade;
    data['cuttable_count'] = this.cuttableCount;
    data['golden_hammer_flag'] = this.goldenHammerFlag;
    data['scroll_resilience_count'] = this.scrollResilienceCount;
    data['scroll_upgradeable_count'] = this.scrollUpgradeableCount;
    data['soul_name'] = this.soulName;
    data['soul_option'] = this.soulOption;
    if (this.itemEtcOption != null) {
      data['item_etc_option'] = this.itemEtcOption!.toJson();
    }
    data['starforce'] = this.starforce;
    data['starforce_scroll_flag'] = this.starforceScrollFlag;
    if (this.itemStarforceOption != null) {
      data['item_starforce_option'] = this.itemStarforceOption!.toJson();
    }
    data['special_ring_level'] = this.specialRingLevel;
    data['date_expire'] = this.dateExpire;
    return data;
  }
}

class ItemTotalOption {
  String? str;
  String? dex;
  String? int;
  String? luk;
  String? maxHp;
  String? maxMp;
  String? attackPower;
  String? magicPower;
  String? armor;
  String? speed;
  String? jump;
  String? bossDamage;
  String? ignoreMonsterArmor;
  String? allStat;
  String? damage;
  double? equipmentLevelDecrease;
  String? maxHpRate;
  String? maxMpRate;

  ItemTotalOption(
      {this.str,
      this.dex,
      this.int,
      this.luk,
      this.maxHp,
      this.maxMp,
      this.attackPower,
      this.magicPower,
      this.armor,
      this.speed,
      this.jump,
      this.bossDamage,
      this.ignoreMonsterArmor,
      this.allStat,
      this.damage,
      this.equipmentLevelDecrease,
      this.maxHpRate,
      this.maxMpRate});

  ItemTotalOption.fromJson(Map<String, dynamic> json) {
    str = json['str'];
    dex = json['dex'];
    int = json['int'];
    luk = json['luk'];
    maxHp = json['max_hp'];
    maxMp = json['max_mp'];
    attackPower = json['attack_power'];
    magicPower = json['magic_power'];
    armor = json['armor'];
    speed = json['speed'];
    jump = json['jump'];
    bossDamage = json['boss_damage'];
    ignoreMonsterArmor = json['ignore_monster_armor'];
    allStat = json['all_stat'];
    damage = json['damage'];
    equipmentLevelDecrease = json['equipment_level_decrease'];
    maxHpRate = json['max_hp_rate'];
    maxMpRate = json['max_mp_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['str'] = this.str;
    data['dex'] = this.dex;
    data['int'] = this.int;
    data['luk'] = this.luk;
    data['max_hp'] = this.maxHp;
    data['max_mp'] = this.maxMp;
    data['attack_power'] = this.attackPower;
    data['magic_power'] = this.magicPower;
    data['armor'] = this.armor;
    data['speed'] = this.speed;
    data['jump'] = this.jump;
    data['boss_damage'] = this.bossDamage;
    data['ignore_monster_armor'] = this.ignoreMonsterArmor;
    data['all_stat'] = this.allStat;
    data['damage'] = this.damage;
    data['equipment_level_decrease'] = this.equipmentLevelDecrease;
    data['max_hp_rate'] = this.maxHpRate;
    data['max_mp_rate'] = this.maxMpRate;
    return data;
  }
}

class ItemBaseOption {
  String? str;
  String? dex;
  String? int;
  String? luk;
  String? maxHp;
  String? maxMp;
  String? attackPower;
  String? magicPower;
  String? armor;
  String? speed;
  String? jump;
  String? bossDamage;
  String? ignoreMonsterArmor;
  String? allStat;
  String? maxHpRate;
  String? maxMpRate;
  double? baseEquipmentLevel;

  ItemBaseOption(
      {this.str,
      this.dex,
      this.int,
      this.luk,
      this.maxHp,
      this.maxMp,
      this.attackPower,
      this.magicPower,
      this.armor,
      this.speed,
      this.jump,
      this.bossDamage,
      this.ignoreMonsterArmor,
      this.allStat,
      this.maxHpRate,
      this.maxMpRate,
      this.baseEquipmentLevel});

  ItemBaseOption.fromJson(Map<String, dynamic> json) {
    str = json['str'];
    dex = json['dex'];
    int = json['int'];
    luk = json['luk'];
    maxHp = json['max_hp'];
    maxMp = json['max_mp'];
    attackPower = json['attack_power'];
    magicPower = json['magic_power'];
    armor = json['armor'];
    speed = json['speed'];
    jump = json['jump'];
    bossDamage = json['boss_damage'];
    ignoreMonsterArmor = json['ignore_monster_armor'];
    allStat = json['all_stat'];
    maxHpRate = json['max_hp_rate'];
    maxMpRate = json['max_mp_rate'];
    baseEquipmentLevel = json['base_equipment_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['str'] = this.str;
    data['dex'] = this.dex;
    data['int'] = this.int;
    data['luk'] = this.luk;
    data['max_hp'] = this.maxHp;
    data['max_mp'] = this.maxMp;
    data['attack_power'] = this.attackPower;
    data['magic_power'] = this.magicPower;
    data['armor'] = this.armor;
    data['speed'] = this.speed;
    data['jump'] = this.jump;
    data['boss_damage'] = this.bossDamage;
    data['ignore_monster_armor'] = this.ignoreMonsterArmor;
    data['all_stat'] = this.allStat;
    data['max_hp_rate'] = this.maxHpRate;
    data['max_mp_rate'] = this.maxMpRate;
    data['base_equipment_level'] = this.baseEquipmentLevel;
    return data;
  }
}

class ItemExceptionalOption {
  String? str;
  String? dex;
  String? int;
  String? luk;
  String? maxHp;
  String? maxMp;
  String? attackPower;
  String? magicPower;

  ItemExceptionalOption(
      {this.str,
      this.dex,
      this.int,
      this.luk,
      this.maxHp,
      this.maxMp,
      this.attackPower,
      this.magicPower});

  ItemExceptionalOption.fromJson(Map<String, dynamic> json) {
    str = json['str'];
    dex = json['dex'];
    int = json['int'];
    luk = json['luk'];
    maxHp = json['max_hp'];
    maxMp = json['max_mp'];
    attackPower = json['attack_power'];
    magicPower = json['magic_power'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['str'] = this.str;
    data['dex'] = this.dex;
    data['int'] = this.int;
    data['luk'] = this.luk;
    data['max_hp'] = this.maxHp;
    data['max_mp'] = this.maxMp;
    data['attack_power'] = this.attackPower;
    data['magic_power'] = this.magicPower;
    return data;
  }
}

class ItemAddOption {
  String? str;
  String? dex;
  String? int;
  String? luk;
  String? maxHp;
  String? maxMp;
  String? attackPower;
  String? magicPower;
  String? armor;
  String? speed;
  String? jump;
  String? bossDamage;
  String? damage;
  String? allStat;
  double? equipmentLevelDecrease;

  ItemAddOption(
      {this.str,
      this.dex,
      this.int,
      this.luk,
      this.maxHp,
      this.maxMp,
      this.attackPower,
      this.magicPower,
      this.armor,
      this.speed,
      this.jump,
      this.bossDamage,
      this.damage,
      this.allStat,
      this.equipmentLevelDecrease});

  ItemAddOption.fromJson(Map<String, dynamic> json) {
    str = json['str'];
    dex = json['dex'];
    int = json['int'];
    luk = json['luk'];
    maxHp = json['max_hp'];
    maxMp = json['max_mp'];
    attackPower = json['attack_power'];
    magicPower = json['magic_power'];
    armor = json['armor'];
    speed = json['speed'];
    jump = json['jump'];
    bossDamage = json['boss_damage'];
    damage = json['damage'];
    allStat = json['all_stat'];
    equipmentLevelDecrease = json['equipment_level_decrease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['str'] = this.str;
    data['dex'] = this.dex;
    data['int'] = this.int;
    data['luk'] = this.luk;
    data['max_hp'] = this.maxHp;
    data['max_mp'] = this.maxMp;
    data['attack_power'] = this.attackPower;
    data['magic_power'] = this.magicPower;
    data['armor'] = this.armor;
    data['speed'] = this.speed;
    data['jump'] = this.jump;
    data['boss_damage'] = this.bossDamage;
    data['damage'] = this.damage;
    data['all_stat'] = this.allStat;
    data['equipment_level_decrease'] = this.equipmentLevelDecrease;
    return data;
  }
}

class ItemEtcOption {
  String? str;
  String? dex;
  String? int;
  String? luk;
  String? maxHp;
  String? maxMp;
  String? attackPower;
  String? magicPower;
  String? armor;
  String? speed;
  String? jump;

  ItemEtcOption(
      {this.str,
      this.dex,
      this.int,
      this.luk,
      this.maxHp,
      this.maxMp,
      this.attackPower,
      this.magicPower,
      this.armor,
      this.speed,
      this.jump});

  ItemEtcOption.fromJson(Map<String, dynamic> json) {
    str = json['str'];
    dex = json['dex'];
    int = json['int'];
    luk = json['luk'];
    maxHp = json['max_hp'];
    maxMp = json['max_mp'];
    attackPower = json['attack_power'];
    magicPower = json['magic_power'];
    armor = json['armor'];
    speed = json['speed'];
    jump = json['jump'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['str'] = this.str;
    data['dex'] = this.dex;
    data['int'] = this.int;
    data['luk'] = this.luk;
    data['max_hp'] = this.maxHp;
    data['max_mp'] = this.maxMp;
    data['attack_power'] = this.attackPower;
    data['magic_power'] = this.magicPower;
    data['armor'] = this.armor;
    data['speed'] = this.speed;
    data['jump'] = this.jump;
    return data;
  }
}

class Title {
  String? titleName;
  String? titleIcon;
  String? titleDescription;
  String? dateExpire;
  String? dateOptionExpire;

  Title(
      {this.titleName,
      this.titleIcon,
      this.titleDescription,
      this.dateExpire,
      this.dateOptionExpire});

  Title.fromJson(Map<String, dynamic> json) {
    titleName = json['title_name'];
    titleIcon = json['title_icon'];
    titleDescription = json['title_description'];
    dateExpire = json['date_expire'];
    dateOptionExpire = json['date_option_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_name'] = this.titleName;
    data['title_icon'] = this.titleIcon;
    data['title_description'] = this.titleDescription;
    data['date_expire'] = this.dateExpire;
    data['date_option_expire'] = this.dateOptionExpire;
    return data;
  }
}

class DragonEquipment {
  String? itemEquipmentPart;
  String? equipmentSlot;
  String? itemName;
  String? itemIcon;
  String? itemDescription;
  String? itemShapeName;
  String? itemShapeIcon;
  String? gender;
  ItemTotalOption? itemTotalOption;
  ItemBaseOption? itemBaseOption;
  int? equipmentLevelIncrease;
  ItemExceptionalOption? itemExceptionalOption;
  ItemAddOption? itemAddOption;
  int? growthExp;
  int? growthLevel;
  String? scrollUpgrade;
  String? cuttableCount;
  String? goldenHammerFlag;
  String? scrollResilienceCount;
  String? scrollUpgradeableCount;
  String? soulName;
  String? soulOption;
  ItemEtcOption? itemEtcOption;
  String? starforce;
  String? starforceScrollFlag;
  ItemEtcOption? itemStarforceOption;
  int? specialRingLevel;
  String? dateExpire;

  DragonEquipment(
      {this.itemEquipmentPart,
      this.equipmentSlot,
      this.itemName,
      this.itemIcon,
      this.itemDescription,
      this.itemShapeName,
      this.itemShapeIcon,
      this.gender,
      this.itemTotalOption,
      this.itemBaseOption,
      this.equipmentLevelIncrease,
      this.itemExceptionalOption,
      this.itemAddOption,
      this.growthExp,
      this.growthLevel,
      this.scrollUpgrade,
      this.cuttableCount,
      this.goldenHammerFlag,
      this.scrollResilienceCount,
      this.scrollUpgradeableCount,
      this.soulName,
      this.soulOption,
      this.itemEtcOption,
      this.starforce,
      this.starforceScrollFlag,
      this.itemStarforceOption,
      this.specialRingLevel,
      this.dateExpire});

  DragonEquipment.fromJson(Map<String, dynamic> json) {
    itemEquipmentPart = json['item_equipment_part'];
    equipmentSlot = json['equipment_slot'];
    itemName = json['item_name'];
    itemIcon = json['item_icon'];
    itemDescription = json['item_description'];
    itemShapeName = json['item_shape_name'];
    itemShapeIcon = json['item_shape_icon'];
    gender = json['gender'];
    itemTotalOption = json['item_total_option'] != null
        ? new ItemTotalOption.fromJson(json['item_total_option'])
        : null;
    itemBaseOption = json['item_base_option'] != null
        ? new ItemBaseOption.fromJson(json['item_base_option'])
        : null;
    equipmentLevelIncrease = json['equipment_level_increase'];
    itemExceptionalOption = json['item_exceptional_option'] != null
        ? new ItemExceptionalOption.fromJson(json['item_exceptional_option'])
        : null;
    itemAddOption = json['item_add_option'] != null
        ? new ItemAddOption.fromJson(json['item_add_option'])
        : null;
    growthExp = json['growth_exp'];
    growthLevel = json['growth_level'];
    scrollUpgrade = json['scroll_upgrade'];
    cuttableCount = json['cuttable_count'];
    goldenHammerFlag = json['golden_hammer_flag'];
    scrollResilienceCount = json['scroll_resilience_count'];
    scrollUpgradeableCount = json['scroll_upgradeable_count'];
    soulName = json['soul_name'];
    soulOption = json['soul_option'];
    itemEtcOption = json['item_etc_option'] != null
        ? new ItemEtcOption.fromJson(json['item_etc_option'])
        : null;
    starforce = json['starforce'];
    starforceScrollFlag = json['starforce_scroll_flag'];
    itemStarforceOption = json['item_starforce_option'] != null
        ? new ItemEtcOption.fromJson(json['item_starforce_option'])
        : null;
    specialRingLevel = json['special_ring_level'];
    dateExpire = json['date_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_equipment_part'] = this.itemEquipmentPart;
    data['equipment_slot'] = this.equipmentSlot;
    data['item_name'] = this.itemName;
    data['item_icon'] = this.itemIcon;
    data['item_description'] = this.itemDescription;
    data['item_shape_name'] = this.itemShapeName;
    data['item_shape_icon'] = this.itemShapeIcon;
    data['gender'] = this.gender;
    if (this.itemTotalOption != null) {
      data['item_total_option'] = this.itemTotalOption!.toJson();
    }
    if (this.itemBaseOption != null) {
      data['item_base_option'] = this.itemBaseOption!.toJson();
    }
    data['equipment_level_increase'] = this.equipmentLevelIncrease;
    if (this.itemExceptionalOption != null) {
      data['item_exceptional_option'] = this.itemExceptionalOption!.toJson();
    }
    if (this.itemAddOption != null) {
      data['item_add_option'] = this.itemAddOption!.toJson();
    }
    data['growth_exp'] = this.growthExp;
    data['growth_level'] = this.growthLevel;
    data['scroll_upgrade'] = this.scrollUpgrade;
    data['cuttable_count'] = this.cuttableCount;
    data['golden_hammer_flag'] = this.goldenHammerFlag;
    data['scroll_resilience_count'] = this.scrollResilienceCount;
    data['scroll_upgradeable_count'] = this.scrollUpgradeableCount;
    data['soul_name'] = this.soulName;
    data['soul_option'] = this.soulOption;
    if (this.itemEtcOption != null) {
      data['item_etc_option'] = this.itemEtcOption!.toJson();
    }
    data['starforce'] = this.starforce;
    data['starforce_scroll_flag'] = this.starforceScrollFlag;
    if (this.itemStarforceOption != null) {
      data['item_starforce_option'] = this.itemStarforceOption!.toJson();
    }
    data['special_ring_level'] = this.specialRingLevel;
    data['date_expire'] = this.dateExpire;
    return data;
  }
}

class MechanicEquipment {
  String? itemEquipmentPart;
  String? equipmentSlot;
  String? itemName;
  String? itemIcon;
  String? itemDescription;
  String? itemShapeName;
  String? itemShapeIcon;
  String? gender;
  ItemTotalOption? itemTotalOption;
  ItemBaseOption? itemBaseOption;
  int? equipmentLevelIncrease;
  ItemExceptionalOption? itemExceptionalOption;
  ItemAddOption? itemAddOption;
  int? growthExp;
  int? growthLevel;
  String? scrollUpgrade;
  String? cuttableCount;
  String? goldenHammerFlag;
  String? scrollResilienceCount;
  String? scrollUpgradeableCount;
  String? soulName;
  String? soulOption;
  ItemEtcOption? itemEtcOption;
  String? starforce;
  String? starforceScrollFlag;
  ItemEtcOption? itemStarforceOption;
  int? specialRingLevel;
  String? dateExpire;

  MechanicEquipment(
      {this.itemEquipmentPart,
      this.equipmentSlot,
      this.itemName,
      this.itemIcon,
      this.itemDescription,
      this.itemShapeName,
      this.itemShapeIcon,
      this.gender,
      this.itemTotalOption,
      this.itemBaseOption,
      this.equipmentLevelIncrease,
      this.itemExceptionalOption,
      this.itemAddOption,
      this.growthExp,
      this.growthLevel,
      this.scrollUpgrade,
      this.cuttableCount,
      this.goldenHammerFlag,
      this.scrollResilienceCount,
      this.scrollUpgradeableCount,
      this.soulName,
      this.soulOption,
      this.itemEtcOption,
      this.starforce,
      this.starforceScrollFlag,
      this.itemStarforceOption,
      this.specialRingLevel,
      this.dateExpire});

  MechanicEquipment.fromJson(Map<String, dynamic> json) {
    itemEquipmentPart = json['item_equipment_part'];
    equipmentSlot = json['equipment_slot'];
    itemName = json['item_name'];
    itemIcon = json['item_icon'];
    itemDescription = json['item_description'];
    itemShapeName = json['item_shape_name'];
    itemShapeIcon = json['item_shape_icon'];
    gender = json['gender'];
    itemTotalOption = json['item_total_option'] != null
        ? new ItemTotalOption.fromJson(json['item_total_option'])
        : null;
    itemBaseOption = json['item_base_option'] != null
        ? new ItemBaseOption.fromJson(json['item_base_option'])
        : null;
    equipmentLevelIncrease = json['equipment_level_increase'];
    itemExceptionalOption = json['item_exceptional_option'] != null
        ? new ItemExceptionalOption.fromJson(json['item_exceptional_option'])
        : null;
    itemAddOption = json['item_add_option'] != null
        ? new ItemAddOption.fromJson(json['item_add_option'])
        : null;
    growthExp = json['growth_exp'];
    growthLevel = json['growth_level'];
    scrollUpgrade = json['scroll_upgrade'];
    cuttableCount = json['cuttable_count'];
    goldenHammerFlag = json['golden_hammer_flag'];
    scrollResilienceCount = json['scroll_resilience_count'];
    scrollUpgradeableCount = json['scroll_upgradeable_count'];
    soulName = json['soul_name'];
    soulOption = json['soul_option'];
    itemEtcOption = json['item_etc_option'] != null
        ? new ItemEtcOption.fromJson(json['item_etc_option'])
        : null;
    starforce = json['starforce'];
    starforceScrollFlag = json['starforce_scroll_flag'];
    itemStarforceOption = json['item_starforce_option'] != null
        ? new ItemEtcOption.fromJson(json['item_starforce_option'])
        : null;
    specialRingLevel = json['special_ring_level'];
    dateExpire = json['date_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_equipment_part'] = this.itemEquipmentPart;
    data['equipment_slot'] = this.equipmentSlot;
    data['item_name'] = this.itemName;
    data['item_icon'] = this.itemIcon;
    data['item_description'] = this.itemDescription;
    data['item_shape_name'] = this.itemShapeName;
    data['item_shape_icon'] = this.itemShapeIcon;
    data['gender'] = this.gender;
    if (this.itemTotalOption != null) {
      data['item_total_option'] = this.itemTotalOption!.toJson();
    }
    if (this.itemBaseOption != null) {
      data['item_base_option'] = this.itemBaseOption!.toJson();
    }
    data['equipment_level_increase'] = this.equipmentLevelIncrease;
    if (this.itemExceptionalOption != null) {
      data['item_exceptional_option'] = this.itemExceptionalOption!.toJson();
    }
    if (this.itemAddOption != null) {
      data['item_add_option'] = this.itemAddOption!.toJson();
    }
    data['growth_exp'] = this.growthExp;
    data['growth_level'] = this.growthLevel;
    data['scroll_upgrade'] = this.scrollUpgrade;
    data['cuttable_count'] = this.cuttableCount;
    data['golden_hammer_flag'] = this.goldenHammerFlag;
    data['scroll_resilience_count'] = this.scrollResilienceCount;
    data['scroll_upgradeable_count'] = this.scrollUpgradeableCount;
    data['soul_name'] = this.soulName;
    data['soul_option'] = this.soulOption;
    if (this.itemEtcOption != null) {
      data['item_etc_option'] = this.itemEtcOption!.toJson();
    }
    data['starforce'] = this.starforce;
    data['starforce_scroll_flag'] = this.starforceScrollFlag;
    if (this.itemStarforceOption != null) {
      data['item_starforce_option'] = this.itemStarforceOption!.toJson();
    }
    data['special_ring_level'] = this.specialRingLevel;
    data['date_expire'] = this.dateExpire;
    return data;
  }
}
