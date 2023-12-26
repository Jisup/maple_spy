class Skill {
  String? date;
  String? characterClass;
  String? characterSkillGrade;
  List<CharacterSkill>? characterSkill;

  Skill(
      {this.date,
      this.characterClass,
      this.characterSkillGrade,
      this.characterSkill});

  Skill.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    characterSkillGrade = json['character_skill_grade'];
    if (json['character_skill'] != null) {
      characterSkill = <CharacterSkill>[];
      json['character_skill'].forEach((v) {
        characterSkill!.add(new CharacterSkill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    data['character_skill_grade'] = this.characterSkillGrade;
    if (this.characterSkill != null) {
      data['character_skill'] =
          this.characterSkill!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CharacterSkill {
  String? skillName;
  String? skillDescription;
  int? skillLevel;
  String? skillEffect;
  String? skillIcon;

  CharacterSkill(
      {this.skillName,
      this.skillDescription,
      this.skillLevel,
      this.skillEffect,
      this.skillIcon});

  CharacterSkill.fromJson(Map<String, dynamic> json) {
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
