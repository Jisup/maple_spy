import 'dart:collection';

import 'package:maplespy/model/skill/hexa_matrix_model.dart';
import 'package:maplespy/model/skill/link_skill_model.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';

class MainSkill {
  Skill? skill;
  LinkSkill link;
  Skill vSkill;
  late Map<String, VDetail> vDetail;
  VMatrix vMatrix;
  Skill hexaSkill;
  late Map<String, String> hexaDetail;
  HexaMatrix hexaMatrix;

  MainSkill({
    required this.skill,
    required this.link,
    required this.vSkill,
    required this.vMatrix,
    required this.hexaSkill,
    required this.hexaMatrix,
  }) {
    /**-----link skill*/
    if (link.characterOwnedLinkSkill != null) {
      if (link.characterLinkSkill?.length != 0) {
        link.characterLinkSkill!.insert(0, link.characterOwnedLinkSkill!);
      } else {
        link.characterLinkSkill = [link.characterOwnedLinkSkill!];
      }
    }

    /**-----v matrix slot total level*/
    vDetail = HashMap();
    for (CharacterVCoreEquipment vCore
        in vMatrix.characterVCoreEquipment ?? []) {
      if (vCore.vCoreSkill1 != null) {
        vDetail.containsKey(vCore.vCoreSkill1)
            ? vDetail.update(vCore.vCoreSkill1!, (value) {
                return VDetail(
                  slotLevel: value.slotLevel + vCore.slotLevel!,
                  skillType: value.skillType,
                );
              })
            : vDetail.addAll({
                vCore.vCoreSkill1!: VDetail(
                  slotLevel: vCore.slotLevel!,
                  skillType: vCore.vCoreType!,
                ),
              });
      }
      if (vCore.vCoreSkill2 != null) {
        vDetail.containsKey(vCore.vCoreSkill2)
            ? vDetail.update(vCore.vCoreSkill2!, (value) {
                return VDetail(
                  slotLevel: value.slotLevel + vCore.slotLevel!,
                  skillType: value.skillType,
                );
              })
            : vDetail.addAll({
                vCore.vCoreSkill2!: VDetail(
                  slotLevel: vCore.slotLevel!,
                  skillType: vCore.vCoreType!,
                ),
              });
      }
      if (vCore.vCoreSkill3 != null) {
        vDetail.containsKey(vCore.vCoreSkill3)
            ? vDetail.update(vCore.vCoreSkill3!, (value) {
                return VDetail(
                  slotLevel: value.slotLevel + vCore.slotLevel!,
                  skillType: value.skillType,
                );
              })
            : vDetail.addAll({
                vCore.vCoreSkill3!: VDetail(
                  slotLevel: vCore.slotLevel!,
                  skillType: vCore.vCoreType!,
                ),
              });
      }
    }

    /**-----hexa matrix core icon*/
    hexaDetail = HashMap();
    for (CharacterHexaCoreEquipment hexaCore
        in hexaMatrix.characterHexaCoreEquipment ?? []) {
      String coreIcon = hexaSkill.characterSkill
              ?.singleWhere((element) =>
                  element.skillName == hexaCore.linkedSkill![0].hexaSkillId)
              .skillIcon ??
          '';
      hexaDetail[hexaCore.linkedSkill![0].hexaSkillId!] = coreIcon;
    }
  }
}
