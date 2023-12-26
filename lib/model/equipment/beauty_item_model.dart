class BeautyItem {
  String? date;
  String? characterGender;
  String? characterClass;
  CharacterHair? characterHair;
  CharacterFace? characterFace;
  String? characterSkinName;
  CharacterHair? additionalCharacterHair;
  CharacterFace? additionalCharacterFace;
  String? additionalCharacterSkinName;

  BeautyItem(
      {this.date,
      this.characterGender,
      this.characterClass,
      this.characterHair,
      this.characterFace,
      this.characterSkinName,
      this.additionalCharacterHair,
      this.additionalCharacterFace,
      this.additionalCharacterSkinName});

  BeautyItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterGender = json['character_gender'];
    characterClass = json['character_class'];
    characterHair = json['character_hair'] != null
        ? new CharacterHair.fromJson(json['character_hair'])
        : null;
    characterFace = json['character_face'] != null
        ? new CharacterFace.fromJson(json['character_face'])
        : null;
    characterSkinName = json['character_skin_name'];
    additionalCharacterHair = json['additional_character_hair'] != null
        ? new CharacterHair.fromJson(json['additional_character_hair'])
        : null;
    additionalCharacterFace = json['additional_character_face'] != null
        ? new CharacterFace.fromJson(json['additional_character_face'])
        : null;
    additionalCharacterSkinName = json['additional_character_skin_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_gender'] = this.characterGender;
    data['character_class'] = this.characterClass;
    if (this.characterHair != null) {
      data['character_hair'] = this.characterHair!.toJson();
    }
    if (this.characterFace != null) {
      data['character_face'] = this.characterFace!.toJson();
    }
    data['character_skin_name'] = this.characterSkinName;
    if (this.additionalCharacterHair != null) {
      data['additional_character_hair'] =
          this.additionalCharacterHair!.toJson();
    }
    if (this.additionalCharacterFace != null) {
      data['additional_character_face'] =
          this.additionalCharacterFace!.toJson();
    }
    data['additional_character_skin_name'] = this.additionalCharacterSkinName;
    return data;
  }
}

class CharacterHair {
  String? hairName;
  String? baseColor;
  String? mixColor;
  String? mixRate;

  CharacterHair({this.hairName, this.baseColor, this.mixColor, this.mixRate});

  CharacterHair.fromJson(Map<String, dynamic> json) {
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

class CharacterFace {
  String? faceName;
  String? baseColor;
  String? mixColor;
  String? mixRate;

  CharacterFace({this.faceName, this.baseColor, this.mixColor, this.mixRate});

  CharacterFace.fromJson(Map<String, dynamic> json) {
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
