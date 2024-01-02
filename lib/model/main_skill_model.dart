import 'package:maple_app/model/skill/hexamatrix_skill_model.dart';
import 'package:maple_app/model/skill/link_skill_model.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/model/skill/vmatrix_skill_model.dart';

class MainSkill {
  Skill? skill;
  LinkSkill? link;
  VmatrixSkill? vmatrix;
  HexamatrixSkill? hexamatrix;

  MainSkill({
    required this.skill,
    required this.link,
    required this.vmatrix,
    required this.hexamatrix,
  });
}
