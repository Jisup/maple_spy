class CashItem {
  String? date;
  String? characterGender;
  String? characterClass;
  int? presetNo;
  List<CashItemEquipmentPreset>? cashItemEquipmentPreset1;
  List<CashItemEquipmentPreset>? cashItemEquipmentPreset2;
  List<CashItemEquipmentPreset>? cashItemEquipmentPreset3;
  List<AdditionalCashItemEquipmentPreset>? additionalCashItemEquipmentPreset1;
  List<AdditionalCashItemEquipmentPreset>? additionalCashItemEquipmentPreset2;
  List<AdditionalCashItemEquipmentPreset>? additionalCashItemEquipmentPreset3;

  CashItem(
      {this.date,
      this.characterGender,
      this.characterClass,
      this.presetNo,
      this.cashItemEquipmentPreset1,
      this.cashItemEquipmentPreset2,
      this.cashItemEquipmentPreset3,
      this.additionalCashItemEquipmentPreset1,
      this.additionalCashItemEquipmentPreset2,
      this.additionalCashItemEquipmentPreset3});

  CashItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterGender = json['character_gender'];
    characterClass = json['character_class'];
    presetNo = json['preset_no'];
    if (json['cash_item_equipment_preset_1'] != null) {
      cashItemEquipmentPreset1 = <CashItemEquipmentPreset>[];
      json['cash_item_equipment_preset_1'].forEach((v) {
        cashItemEquipmentPreset1!.add(new CashItemEquipmentPreset.fromJson(v));
      });
    }
    if (json['cash_item_equipment_preset_2'] != null) {
      cashItemEquipmentPreset2 = <CashItemEquipmentPreset>[];
      json['cash_item_equipment_preset_2'].forEach((v) {
        cashItemEquipmentPreset2!.add(new CashItemEquipmentPreset.fromJson(v));
      });
    }
    if (json['cash_item_equipment_preset_3'] != null) {
      cashItemEquipmentPreset3 = <CashItemEquipmentPreset>[];
      json['cash_item_equipment_preset_3'].forEach((v) {
        cashItemEquipmentPreset3!.add(new CashItemEquipmentPreset.fromJson(v));
      });
    }
    if (json['additional_cash_item_equipment_preset_1'] != null) {
      additionalCashItemEquipmentPreset1 =
          <AdditionalCashItemEquipmentPreset>[];
      json['additional_cash_item_equipment_preset_1'].forEach((v) {
        additionalCashItemEquipmentPreset1!
            .add(new AdditionalCashItemEquipmentPreset.fromJson(v));
      });
    }
    if (json['additional_cash_item_equipment_preset_2'] != null) {
      additionalCashItemEquipmentPreset2 =
          <AdditionalCashItemEquipmentPreset>[];
      json['additional_cash_item_equipment_preset_2'].forEach((v) {
        additionalCashItemEquipmentPreset2!
            .add(new AdditionalCashItemEquipmentPreset.fromJson(v));
      });
    }
    if (json['additional_cash_item_equipment_preset_3'] != null) {
      additionalCashItemEquipmentPreset3 =
          <AdditionalCashItemEquipmentPreset>[];
      json['additional_cash_item_equipment_preset_3'].forEach((v) {
        additionalCashItemEquipmentPreset3!
            .add(new AdditionalCashItemEquipmentPreset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_gender'] = this.characterGender;
    data['character_class'] = this.characterClass;
    data['preset_no'] = this.presetNo;
    if (this.cashItemEquipmentPreset1 != null) {
      data['cash_item_equipment_preset_1'] =
          this.cashItemEquipmentPreset1!.map((v) => v.toJson()).toList();
    }
    if (this.cashItemEquipmentPreset2 != null) {
      data['cash_item_equipment_preset_2'] =
          this.cashItemEquipmentPreset2!.map((v) => v.toJson()).toList();
    }
    if (this.cashItemEquipmentPreset3 != null) {
      data['cash_item_equipment_preset_3'] =
          this.cashItemEquipmentPreset3!.map((v) => v.toJson()).toList();
    }
    if (this.additionalCashItemEquipmentPreset1 != null) {
      data['additional_cash_item_equipment_preset_1'] = this
          .additionalCashItemEquipmentPreset1!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.additionalCashItemEquipmentPreset2 != null) {
      data['additional_cash_item_equipment_preset_2'] = this
          .additionalCashItemEquipmentPreset2!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.additionalCashItemEquipmentPreset3 != null) {
      data['additional_cash_item_equipment_preset_3'] = this
          .additionalCashItemEquipmentPreset3!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class CashItemEquipmentPreset {
  String? cashItemEquipmentPart;
  String? cashItemEquipmentSlot;
  String? cashItemName;
  String? cashItemIcon;
  String? cashItemDescription;
  List<CashItemOption>? cashItemOption;
  String? dateExpire;
  String? dateOptionExpire;
  String? cashItemLabel;
  CashItemColoringPrism? cashItemColoringPrism;
  String? basePresetItemDisableFlag;

  CashItemEquipmentPreset(
      {this.cashItemEquipmentPart,
      this.cashItemEquipmentSlot,
      this.cashItemName,
      this.cashItemIcon,
      this.cashItemDescription,
      this.cashItemOption,
      this.dateExpire,
      this.dateOptionExpire,
      this.cashItemLabel,
      this.cashItemColoringPrism,
      this.basePresetItemDisableFlag});

  CashItemEquipmentPreset.fromJson(Map<String, dynamic> json) {
    cashItemEquipmentPart = json['cash_item_equipment_part'];
    cashItemEquipmentSlot = json['cash_item_equipment_slot'];
    cashItemName = json['cash_item_name'];
    cashItemIcon = json['cash_item_icon'];
    cashItemDescription = json['cash_item_description'];
    if (json['cash_item_option'] != null) {
      cashItemOption = <CashItemOption>[];
      json['cash_item_option'].forEach((v) {
        cashItemOption!.add(new CashItemOption.fromJson(v));
      });
    }
    dateExpire = json['date_expire'];
    dateOptionExpire = json['date_option_expire'];
    cashItemLabel = json['cash_item_label'];
    cashItemColoringPrism = json['cash_item_coloring_prism'] != null
        ? new CashItemColoringPrism.fromJson(json['cash_item_coloring_prism'])
        : null;
    basePresetItemDisableFlag = json['base_preset_item_disable_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cash_item_equipment_part'] = this.cashItemEquipmentPart;
    data['cash_item_equipment_slot'] = this.cashItemEquipmentSlot;
    data['cash_item_name'] = this.cashItemName;
    data['cash_item_icon'] = this.cashItemIcon;
    data['cash_item_description'] = this.cashItemDescription;
    if (this.cashItemOption != null) {
      data['cash_item_option'] =
          this.cashItemOption!.map((v) => v.toJson()).toList();
    }
    data['date_expire'] = this.dateExpire;
    data['date_option_expire'] = this.dateOptionExpire;
    data['cash_item_label'] = this.cashItemLabel;
    if (this.cashItemColoringPrism != null) {
      data['cash_item_coloring_prism'] = this.cashItemColoringPrism!.toJson();
    }
    data['base_preset_item_disable_flag'] = this.basePresetItemDisableFlag;
    return data;
  }
}

class AdditionalCashItemEquipmentPreset {
  String? cashItemEquipmentPart;
  String? cashItemEquipmentSlot;
  String? cashItemName;
  String? cashItemIcon;
  String? cashItemDescription;
  List<CashItemOption>? cashItemOption;
  String? dateExpire;
  String? dateOptionExpire;
  String? cashItemLabel;
  CashItemColoringPrism? cashItemColoringPrism;
  String? basePresetItemDisableFlag;

  AdditionalCashItemEquipmentPreset(
      {this.cashItemEquipmentPart,
      this.cashItemEquipmentSlot,
      this.cashItemName,
      this.cashItemIcon,
      this.cashItemDescription,
      this.cashItemOption,
      this.dateExpire,
      this.dateOptionExpire,
      this.cashItemLabel,
      this.cashItemColoringPrism,
      this.basePresetItemDisableFlag});

  AdditionalCashItemEquipmentPreset.fromJson(Map<String, dynamic> json) {
    cashItemEquipmentPart = json['cash_item_equipment_part'];
    cashItemEquipmentSlot = json['cash_item_equipment_slot'];
    cashItemName = json['cash_item_name'];
    cashItemIcon = json['cash_item_icon'];
    cashItemDescription = json['cash_item_description'];
    if (json['cash_item_option'] != null) {
      cashItemOption = <CashItemOption>[];
      json['cash_item_option'].forEach((v) {
        cashItemOption!.add(new CashItemOption.fromJson(v));
      });
    }
    dateExpire = json['date_expire'];
    dateOptionExpire = json['date_option_expire'];
    cashItemLabel = json['cash_item_label'];
    cashItemColoringPrism = json['cash_item_coloring_prism'] != null
        ? new CashItemColoringPrism.fromJson(json['cash_item_coloring_prism'])
        : null;
    basePresetItemDisableFlag = json['base_preset_item_disable_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cash_item_equipment_part'] = this.cashItemEquipmentPart;
    data['cash_item_equipment_slot'] = this.cashItemEquipmentSlot;
    data['cash_item_name'] = this.cashItemName;
    data['cash_item_icon'] = this.cashItemIcon;
    data['cash_item_description'] = this.cashItemDescription;
    if (this.cashItemOption != null) {
      data['cash_item_option'] =
          this.cashItemOption!.map((v) => v.toJson()).toList();
    }
    data['date_expire'] = this.dateExpire;
    data['date_option_expire'] = this.dateOptionExpire;
    data['cash_item_label'] = this.cashItemLabel;
    if (this.cashItemColoringPrism != null) {
      data['cash_item_coloring_prism'] = this.cashItemColoringPrism!.toJson();
    }
    data['base_preset_item_disable_flag'] = this.basePresetItemDisableFlag;
    return data;
  }
}

class CashItemOption {
  String? optionType;
  String? optionValue;

  CashItemOption({this.optionType, this.optionValue});

  CashItemOption.fromJson(Map<String, dynamic> json) {
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

class CashItemColoringPrism {
  String? colorRange;
  int? hue;
  int? saturation;
  int? value;

  CashItemColoringPrism(
      {this.colorRange, this.hue, this.saturation, this.value});

  CashItemColoringPrism.fromJson(Map<String, dynamic> json) {
    colorRange = json['color_range'];
    hue = json['hue'];
    saturation = json['saturation'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_range'] = this.colorRange;
    data['hue'] = this.hue;
    data['saturation'] = this.saturation;
    data['value'] = this.value;
    return data;
  }
}
