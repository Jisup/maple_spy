import 'package:flutter/material.dart';
import 'package:maplespy/config/color_config.dart';

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
  /**-----label */
  static final labelTextColor = {
    '마스터라벨': CashItemColor.masterLabelText,
    '블랙라벨': CashItemColor.blackLabelText,
    '레드라벨': CashItemColor.redLabelText,
    '스페셜라벨': CashItemColor.specialLabelText,
    null: Colors.transparent,
  };
  static final labelInitialColor = {
    '마스터라벨': CashItemColor.initialText,
    '블랙라벨': CashItemColor.initialText,
    '레드라벨': CashItemColor.initialText,
    '스페셜라벨': CashItemColor.subInitialText,
    '캐시': Colors.white,
    null: Colors.transparent,
  };
  static final labelInitialShadowColor = {
    '마스터라벨': CashItemColor.initialShadow,
    '블랙라벨': CashItemColor.initialShadow,
    '레드라벨': CashItemColor.initialShadow,
    '스페셜라벨': CashItemColor.subInitialShadow,
    '캐시': Colors.black26,
    null: Colors.transparent,
  };
  static final labelBorderColor = {
    '마스터라벨': CashItemColor.masterBorder,
    '블랙라벨': CashItemColor.blackBorder,
    '레드라벨': CashItemColor.redBorder,
    '스페셜라벨': CashItemColor.specialBorder,
    '캐시': CashItemColor.border,
    null: Colors.transparent,
  };
  static final labelStartBackgroundColor = {
    '마스터라벨': CashItemColor.masterStartBackground,
    '블랙라벨': CashItemColor.blackStartBackground,
    '레드라벨': CashItemColor.redStartBackground,
    '스페셜라벨': CashItemColor.specialStartBackground,
    '캐시': CashItemColor.startBackground,
    null: Colors.transparent,
  };
  static final labelEndBackgroundColor = {
    '마스터라벨': CashItemColor.masterEndBackground,
    '블랙라벨': CashItemColor.blackEndBackground,
    '레드라벨': CashItemColor.redEndBackground,
    '스페셜라벨': CashItemColor.specialEndBackground,
    '캐시': CashItemColor.endBackground,
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
    '레전드리': StatColor.statLegendaryBackground,
    '유니크': StatColor.statUniqueBackground,
    '에픽': StatColor.statEpicBackground,
    '레어': StatColor.statRareBackground,
    null: Colors.transparent,
  };
  static final statStartBackgroundColor = {
    '레전드리': StatColor.statLegendaryStartBackground,
    '유니크': StatColor.statUniqueStartBackground,
    '에픽': StatColor.statEpicStartBackground,
    null: Colors.transparent,
  };
  static final statEndBackgroundColor = {
    '레전드리': StatColor.statLegendaryEndBackground,
    '유니크': StatColor.statUniqueEndBackground,
    '에픽': StatColor.statEpicEndBackground,
    null: Colors.transparent,
  };
  static final statBorderColor = {
    '레전드리': StatColor.statLegendaryBorder,
    '유니크': StatColor.statUniqueBorder,
    '에픽': StatColor.statEpicBorder,
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
  /**-----label */
  static final labelInitialText = {
    '마스터라벨': 'M',
    '블랙라벨': 'B',
    '레드라벨': 'R',
    '스페셜라벨': 'S',
    '캐시': 'C',
    null: '',
  };

  /**----------function */
  /**-----stat */
  static String switchClassMainStat({required String className}) {
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
      // '캐논슈터' ||
      '캐논마스터' ||
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

  static double switchHexaStatValue({required String? name}) {
    return switch (name) {
      '크리티컬 데미지' => 0.35,
      '보스 데미지' || '방어율 무시' => 1,
      '데미지' => 0.75,
      '공격력' || '마력' => 5,
      '주력 스탯' => 100,
      _ => 0,
    };
  }

  static double switchHexaStatMainValue(
      {required String? name, required int level}) {
    double value = switchHexaStatValue(name: name);
    double result = 0;

    //4렙까지 1배율
    if (level < 5) return value * level;
    result += value * 4;

    //5렙부터 2배율
    if (level < 8) return result + value * 2 * (level - 4);
    result += value * 2 * 3;

    //8랩부터 3배율
    if (level < 10) return result + value * 3 * (level - 7);
    result += value * 3 * 2;

    //10렙에 4배율
    return result + value * 4;
  }

  static double switchHexaStatAdditionalValue(
      {required String? name, required int level}) {
    return switchHexaStatValue(name: name) * level;
  }

  static String switchHexaStatValueToString(
      {required String? name, required double value}) {
    return switch (name) {
      '크리티컬 데미지' ||
      '보스 데미지' ||
      '방어율 무시' ||
      '데미지' =>
        '+${value.toStringAsFixed(2)}%',
      '공격력' || '마력' || 'STR' || 'DEX' || 'INT' || 'LUK' => '+${value.toInt()}',
      _ => '',
    };
  }
}
