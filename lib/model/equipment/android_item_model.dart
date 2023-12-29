class AndroidItem {
  String? date;
  String? androidName;
  String? androidNickname;
  String? androidIcon;
  String? androidDescription;
  AndroidHair? androidHair;
  AndroidFace? androidFace;
  String? androidSkinName;
  List<AndroidCashItemEquipment>? androidCashItemEquipment;
  String? androidEarSensorClipFlag;

  AndroidItem(
      {this.date,
      this.androidName,
      this.androidNickname,
      this.androidIcon,
      this.androidDescription,
      this.androidHair,
      this.androidFace,
      this.androidSkinName,
      this.androidCashItemEquipment,
      this.androidEarSensorClipFlag});

  AndroidItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    androidName = json['android_name'];
    androidNickname = json['android_nickname'];
    androidIcon = json['android_icon'];
    androidDescription = json['android_description'];
    androidHair = json['android_hair'] != null
        ? new AndroidHair.fromJson(json['android_hair'])
        : null;
    androidFace = json['android_face'] != null
        ? new AndroidFace.fromJson(json['android_face'])
        : null;
    androidSkinName = json['android_skin_name'];
    if (json['android_cash_item_equipment'] != null) {
      androidCashItemEquipment = <AndroidCashItemEquipment>[];
      json['android_cash_item_equipment'].forEach((v) {
        androidCashItemEquipment!.add(new AndroidCashItemEquipment.fromJson(v));
      });
    }
    androidEarSensorClipFlag = json['android_ear_sensor_clip_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['android_name'] = this.androidName;
    data['android_nickname'] = this.androidNickname;
    data['android_icon'] = this.androidIcon;
    data['android_description'] = this.androidDescription;
    if (this.androidHair != null) {
      data['android_hair'] = this.androidHair!.toJson();
    }
    if (this.androidFace != null) {
      data['android_face'] = this.androidFace!.toJson();
    }
    data['android_skin_name'] = this.androidSkinName;
    if (this.androidCashItemEquipment != null) {
      data['android_cash_item_equipment'] =
          this.androidCashItemEquipment!.map((v) => v.toJson()).toList();
    }
    data['android_ear_sensor_clip_flag'] = this.androidEarSensorClipFlag;
    return data;
  }
}

class AndroidHair {
  String? hairName;
  String? baseColor;
  String? mixColor;
  String? mixRate;

  AndroidHair({this.hairName, this.baseColor, this.mixColor, this.mixRate});

  AndroidHair.fromJson(Map<String, dynamic> json) {
    hairName = json['hair_name'];
    baseColor = json['base_color'];
    mixColor = json['mix_color'];
    mixRate = json['mix_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hair_name'] = this.hairName;
    data['base_color'] = this.baseColor;
    data['mix_color'] = this.mixColor;
    data['mix_rate'] = this.mixRate;
    return data;
  }
}

class AndroidFace {
  String? faceName;
  String? baseColor;
  String? mixColor;
  String? mixRate;

  AndroidFace({this.faceName, this.baseColor, this.mixColor, this.mixRate});

  AndroidFace.fromJson(Map<String, dynamic> json) {
    faceName = json['face_name'];
    baseColor = json['base_color'];
    mixColor = json['mix_color'];
    mixRate = json['mix_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['face_name'] = this.faceName;
    data['base_color'] = this.baseColor;
    data['mix_color'] = this.mixColor;
    data['mix_rate'] = this.mixRate;
    return data;
  }
}

class AndroidCashItemEquipment {
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

  AndroidCashItemEquipment(
      {this.cashItemEquipmentPart,
      this.cashItemEquipmentSlot,
      this.cashItemName,
      this.cashItemIcon,
      this.cashItemDescription,
      this.cashItemOption,
      this.dateExpire,
      this.dateOptionExpire,
      this.cashItemLabel,
      this.cashItemColoringPrism});

  AndroidCashItemEquipment.fromJson(Map<String, dynamic> json) {
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