class LinkSkill {
  String? date;
  String? characterClass;
  List<CharacterLinkSkill>? characterLinkSkill;
  CharacterLinkSkill? characterOwnedLinkSkill;

  LinkSkill(
      {this.date,
      this.characterClass,
      this.characterLinkSkill,
      this.characterOwnedLinkSkill});

  LinkSkill.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    if (json['character_link_skill'] != null) {
      characterLinkSkill = <CharacterLinkSkill>[];
      json['character_link_skill'].forEach((v) {
        characterLinkSkill!.add(new CharacterLinkSkill.fromJson(v));
      });
    }
    characterOwnedLinkSkill = json['character_owned_link_skill'] != null
        ? new CharacterLinkSkill.fromJson(json['character_owned_link_skill'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    if (this.characterLinkSkill != null) {
      data['character_link_skill'] =
          this.characterLinkSkill!.map((v) => v.toJson()).toList();
    }
    if (this.characterOwnedLinkSkill != null) {
      data['character_owned_link_skill'] =
          this.characterOwnedLinkSkill!.toJson();
    }
    return data;
  }
}

class CharacterLinkSkill {
  String? skillName;
  String? skillDescription;
  int? skillLevel;
  String? skillEffect;
  String? skillIcon;

  CharacterLinkSkill(
      {this.skillName,
      this.skillDescription,
      this.skillLevel,
      this.skillEffect,
      this.skillIcon});

  CharacterLinkSkill.fromJson(Map<String, dynamic> json) {
    skillName = json['skill_name'];
    skillDescription = json['skill_description'];
    skillLevel = json['skill_level'];
    skillEffect = json['skill_effect'];
    skillIcon = json['skill_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill_name'] = this.skillName;
    data['skill_description'] = this.skillDescription;
    data['skill_level'] = this.skillLevel;
    data['skill_effect'] = this.skillEffect;
    data['skill_icon'] = this.skillIcon;
    return data;
  }
}
