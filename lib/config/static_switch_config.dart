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
      '히어로' ||
      '팔라딘' ||
      '다크나이트' ||
      '소울마스터' ||
      '미하일' ||
      '블래스터' ||
      '데몬 슬레이어' ||
      '아란' ||
      '카이저' ||
      '제로' ||
      '바이퍼' ||
      '캐논슈터' ||
      '스트라이커' ||
      '은월' ||
      '아크' =>
        'STR',
      '보우마스터' ||
      '신궁' ||
      '패스파인더' ||
      '윈드브레이커' ||
      '와일드헌터' ||
      '메르세데스' ||
      '카인' ||
      '캡틴' ||
      '메카닉' ||
      '엔젤릭버스터' =>
        'DEX',
      '아크메이지(불,독)' ||
      '아크메이지(썬,콜)' ||
      '비숍' ||
      '플레임위자드' ||
      '배틀메이지' ||
      '에반' ||
      '루미너스' ||
      '일리움' ||
      '라라' ||
      '키네시스' =>
        'INT',
      '나이트로드' ||
      '섀도어' ||
      '듀얼블레이드' ||
      '나이트워커' ||
      '팬텀' ||
      '카데나' ||
      '칼리' ||
      '호영' =>
        'LUK',
      '데몬 어벤져' => 'HP',
      '제논' => 'ALL',
      _ => '',
    };
  }
}
