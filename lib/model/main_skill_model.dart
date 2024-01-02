import 'package:maple_app/model/skill/hexamatrix_skill_model.dart';
import 'package:maple_app/model/skill/link_skill_model.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/model/skill/vmatrix_skill_model.dart';

class MainSkill {
  Skill? skill;
  LinkSkill link;
  Skill vSkill;
  VmatrixSkill vmatrix;
  Skill hexaSkill;
  HexamatrixSkill hexamatrix;

  MainSkill({
    required this.skill,
    required this.link,
    required this.vSkill,
    required this.vmatrix,
    required this.hexaSkill,
    required this.hexamatrix,
  });
}
