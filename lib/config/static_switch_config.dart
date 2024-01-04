import 'package:flutter/material.dart';
import 'package:maple_app/config/color_config.dart';

class StaticSwitchConfig {
  /**----------color */
  /**-----potential */
  static final potentialGradeColor = {
    '레전드리': ItemColor.legendaryPotentialBorder,
    '유니크': ItemColor.uniquePotentialBorder,
    '에픽': ItemColor.epicPotentialBorder,
    '레어': ItemColor.rarePotentialBorder,
    null: Colors.transparent,
  };
  static final potentialGradeDetailColor = {
    '레전드리': ItemColor.legendaryPotentialDetailBorder,
    '유니크': ItemColor.uniquePotentialDetailBorder,
    '에픽': ItemColor.epicPotentialDetailBorder,
    '레어': ItemColor.rarePotentialDetailBorder,
    null: Colors.transparent,
  };
  static final potentialGradeIconBorderColor = {
    '레전드리': ItemColor.legendaryIconBorder,
    '유니크': ItemColor.uniqueIconBorder,
    '에픽': ItemColor.epicIconBorder,
    '레어': ItemColor.rareIconBorder,
    null: Colors.transparent,
  };
  static final potentialGradeIconTextShadowColor = {
    '레전드리': ItemColor.legendaryIconTextShadow,
    '유니크': ItemColor.uniqueIconTextShadow,
    '에픽': ItemColor.epicIconTextShadow,
    '레어': ItemColor.rareIconTextShadow,
    null: Colors.transparent,
  };
  /**-----core */
  static final hexaCoreStartBackgroundColor = {
    '공용 코어': SkillColor.hexaCoreStartBackground,
    '스킬 코어': SkillColor.hexaSkillCoreStartBackground,
    '강화 코어': SkillColor.hexaEnhanceCoreStartBackground,
    '마스터리 코어': SkillColor.hexaMasteryCoreStartBackground,
    null: Colors.transparent,
  };
  static final hexaCoreEndBackgroundColor = {
    '공용 코어': SkillColor.hexaCoreEndBackground,
    '스킬 코어': SkillColor.hexaSkillCoreEndBackground,
    '강화 코어': SkillColor.hexaEnhanceCoreEndBackground,
    '마스터리 코어': SkillColor.hexaMasteryCoreEndBackground,
    null: Colors.transparent,
  };
  static final hexaCoreBorderColor = {
    '공용 코어': SkillColor.hexaCoreBorder,
    '스킬 코어': SkillColor.hexaSkillCoreBorder,
    '강화 코어': SkillColor.hexaEnhanceCoreBorder,
    '마스터리 코어': SkillColor.hexaMasteryCoreBorder,
    null: Colors.transparent,
  };
  static final vCoreStartBackgroundColor = {
    '스킬코어': SkillColor.vSkillCoreStartBackground,
    '강화코어': SkillColor.vMasteryCoreStartBackground,
    null: Colors.transparent,
  };
  static final vCoreEndBackgroundColor = {
    '스킬코어': SkillColor.vSkillCoreEndBackground,
    '강화코어': SkillColor.vMasteryCoreEndBackground,
    null: Colors.transparent,
  };
  /**-----stat */
  static final statBackgroundColor = {
    '레전드리': StatColor.statLegendaryBackgroundColor,
    '유니크': StatColor.statUniqueBackgroundColor,
    '에픽': StatColor.statEpicBackgroundColor,
    '레어': StatColor.statRareBackgroundColor,
    null: Colors.transparent,
  };
  static final statStartBackgroundColor = {
    '레전드리': StatColor.statLegendaryStartBackgroundColor,
    '유니크': StatColor.statUniqueStartBackgroundColor,
    '에픽': StatColor.statEpicStartBackgroundColor,
    null: Colors.transparent,
  };
  static final statEndBackgroundColor = {
    '레전드리': StatColor.statLegendaryEndBackgroundColor,
    '유니크': StatColor.statUniqueEndBackgroundColor,
    '에픽': StatColor.statEpicEndBackgroundColor,
    null: Colors.transparent,
  };
  static final statBorderColor = {
    '레전드리': StatColor.statLegendaryBorderColor,
    '유니크': StatColor.statUniqueBorderColor,
    '에픽': StatColor.statEpicBorderColor,
    null: Colors.transparent,
  };

  /**----------text */
  /**-----potential */
  static final potentialGradeCircleText = {
    '레전드리': 'L',
    '유니크': 'U',
    '에픽': 'E',
    '레어': 'R',
    null: '',
  };

  /**----------function */
  /**-----stat */
  static String switchClassMainStat(String className) {
    return switch (className) {
      '히어로' => 'STR',
      '보우마스터' || '사수' => 'DEX',
      '아크메이지(불,독)' => 'INT',
      '나이트로드' => 'LUK',
      _ => 'ALL',
    };
  }
}
