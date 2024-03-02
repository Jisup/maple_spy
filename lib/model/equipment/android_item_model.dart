import 'package:maplespy/model/equipment/cash_item_model.dart';

class AndroidItem {
  String? date;
  String? androidName;
  String? androidNickname;
  String? androidIcon;
  String? androidDescription;
  AndroidHair? androidHair;
  AndroidFace? androidFace;
  String? androidSkinName;
  List<CashItemEquipment>? androidCashItemEquipment;
  String? androidEarSensorClipFlag;
  String? androidGender;
  String? androidGrade;
  String? androidNonHumanoidFlag;
  String? androidShopUsableFlag;
  int? presetNo;
  AndroidPreset? androidPreset1;
  AndroidPreset? androidPreset2;
  AndroidPreset? androidPreset3;

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
      this.androidEarSensorClipFlag,
      this.androidGender,
      this.androidGrade,
      this.androidNonHumanoidFlag,
      this.androidShopUsableFlag,
      this.presetNo,
      this.androidPreset1,
      this.androidPreset2,
      this.androidPreset3});

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
      androidCashItemEquipment = <CashItemEquipment>[];
      json['android_cash_item_equipment'].forEach((v) {
        androidCashItemEquipment!.add(new CashItemEquipment.fromJson(v));
      });
    }
    androidEarSensorClipFlag = json['android_ear_sensor_clip_flag'];
    androidGender = json['android_gender'];
    androidGrade = json['android_grade'];
    androidNonHumanoidFlag = json['android_non_humanoid_flag'];
    androidShopUsableFlag = json['android_shop_usable_flag'];
    presetNo = json['preset_no'];
    androidPreset1 = json['android_preset_1'] != null
        ? new AndroidPreset.fromJson(json['android_preset_1'])
        : null;
    androidPreset2 = json['android_preset_2'] != null
        ? new AndroidPreset.fromJson(json['android_preset_2'])
        : null;
    androidPreset3 = json['android_preset_3'] != null
        ? new AndroidPreset.fromJson(json['android_preset_3'])
        : null;
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
    data['android_gender'] = this.androidGender;
    data['android_grade'] = this.androidGrade;
    data['android_non_humanoid_flag'] = this.androidNonHumanoidFlag;
    data['android_shop_usable_flag'] = this.androidShopUsableFlag;
    data['preset_no'] = this.presetNo;
    if (this.androidPreset1 != null) {
      data['android_preset_1'] = this.androidPreset1!.toJson();
    }
    if (this.androidPreset2 != null) {
      data['android_preset_2'] = this.androidPreset2!.toJson();
    }
    if (this.androidPreset3 != null) {
      data['android_preset_3'] = this.androidPreset3!.toJson();
    }
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

class AndroidPreset {
  String? androidName;
  String? androidNickname;
  String? androidIcon;
  String? androidDescription;
  String? androidGender;
  String? androidGrade;
  String? androidSkinName;
  AndroidHair? androidHair;
  AndroidFace? androidFace;
  String? androidEarSensorClipFlag;
  String? androidNonHumanoidFlag;
  String? androidShopUsableFlag;

  AndroidPreset(
      {this.androidName,
      this.androidNickname,
      this.androidIcon,
      this.androidDescription,
      this.androidGender,
      this.androidGrade,
      this.androidSkinName,
      this.androidHair,
      this.androidFace,
      this.androidEarSensorClipFlag,
      this.androidNonHumanoidFlag,
      this.androidShopUsableFlag});

  AndroidPreset.fromJson(Map<String, dynamic> json) {
    androidName = json['android_name'];
    androidNickname = json['android_nickname'];
    androidIcon = json['android_icon'];
    androidDescription = json['android_description'];
    androidGender = json['android_gender'];
    androidGrade = json['android_grade'];
    androidSkinName = json['android_skin_name'];
    androidHair = json['android_hair'] != null
        ? new AndroidHair.fromJson(json['android_hair'])
        : null;
    androidFace = json['android_face'] != null
        ? new AndroidFace.fromJson(json['android_face'])
        : null;
    androidEarSensorClipFlag = json['android_ear_sensor_clip_flag'];
    androidNonHumanoidFlag = json['android_non_humanoid_flag'];
    androidShopUsableFlag = json['android_shop_usable_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['android_name'] = this.androidName;
    data['android_nickname'] = this.androidNickname;
    data['android_icon'] = this.androidIcon;
    data['android_description'] = this.androidDescription;
    data['android_gender'] = this.androidGender;
    data['android_grade'] = this.androidGrade;
    data['android_skin_name'] = this.androidSkinName;
    if (this.androidHair != null) {
      data['android_hair'] = this.androidHair!.toJson();
    }
    if (this.androidFace != null) {
      data['android_face'] = this.androidFace!.toJson();
    }
    data['android_ear_sensor_clip_flag'] = this.androidEarSensorClipFlag;
    data['android_non_humanoid_flag'] = this.androidNonHumanoidFlag;
    data['android_shop_usable_flag'] = this.androidShopUsableFlag;
    return data;
  }
}
