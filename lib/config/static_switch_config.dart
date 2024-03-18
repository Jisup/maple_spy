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
    '마스터라벨': CashColor.masterLabelText,
    '블랙라벨': CashColor.blackLabelText,
    '레드라벨': CashColor.redLabelText,
    '스페셜라벨': CashColor.specialLabelText,
    null: Colors.transparent,
  };
  static final labelInitialColor = {
    '마스터라벨': CashColor.initialText,
    '블랙라벨': CashColor.initialText,
    '레드라벨': CashColor.initialText,
    '스페셜라벨': CashColor.subInitialText,
    '캐시': Colors.white,
    null: Colors.transparent,
  };
  static final labelInitialShadowColor = {
    '마스터라벨': CashColor.initialShadow,
    '블랙라벨': CashColor.initialShadow,
    '레드라벨': CashColor.initialShadow,
    '스페셜라벨': CashColor.subInitialShadow,
    '캐시': Colors.black26,
    null: Colors.transparent,
  };
  static final labelBorderColor = {
    '마스터라벨': CashColor.masterBorder,
    '블랙라벨': CashColor.blackBorder,
    '레드라벨': CashColor.redBorder,
    '스페셜라벨': CashColor.specialBorder,
    '캐시': CashColor.border,
    null: Colors.transparent,
  };
  static final labelStartBackgroundColor = {
    '마스터라벨': CashColor.masterStartBackground,
    '블랙라벨': CashColor.blackStartBackground,
    '레드라벨': CashColor.redStartBackground,
    '스페셜라벨': CashColor.specialStartBackground,
    '캐시': CashColor.startBackground,
    null: Colors.transparent,
  };
  static final labelEndBackgroundColor = {
    '마스터라벨': CashColor.masterEndBackground,
    '블랙라벨': CashColor.blackEndBackground,
    '레드라벨': CashColor.redEndBackground,
    '스페셜라벨': CashColor.specialEndBackground,
    '캐시': CashColor.endBackground,
    null: Colors.transparent,
  };
  static final petLabelInitialColor = {
    '루나 쁘띠': PetColor.initialText,
    '루나 드림': PetColor.initialText,
    '루나 스윗': PetColor.initialText,
    '원더 블랙': PetColor.subInitialText,
    '캐시': PetColor.text,
    null: Colors.transparent,
  };
  static final petLabelTextColor = {
    '루나 쁘띠': PetColor.lunaPetitText,
    '루나 드림': PetColor.lunaDreamText,
    '루나 스윗': PetColor.lunaSweetText,
    '원더 블랙': PetColor.wonderBlackText,
    null: Colors.transparent,
  };
  static final petLabelBorderColor = {
    '루나 쁘띠': PetColor.lunaPetitBorder,
    '루나 드림': PetColor.lunaDreamBorder,
    '루나 스윗': PetColor.lunaSweetBorder,
    '원더 블랙': PetColor.wonderBlackBorder,
    '캐시': PetColor.border,
    null: Colors.transparent,
  };
  static final petLabelStartBackgroundColor = {
    '루나 쁘띠': PetColor.lunaPetitStartBackground,
    '루나 드림': PetColor.lunaDreamStartBackground,
    '루나 스윗': PetColor.lunaSweetStartBackground,
    '원더 블랙': PetColor.wonderStartBackground,
    '캐시': PetColor.startBackground,
    null: Colors.transparent,
  };
  static final petLabelEndBackgroundColor = {
    '루나 쁘띠': PetColor.lunaPetitEndBackground,
    '루나 드림': PetColor.lunaDreamEndBackground,
    '루나 스윗': PetColor.lunaSweetEndBackground,
    '원더 블랙': PetColor.wonderEndBackground,
    '캐시': PetColor.endBackground,
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
  static final petLabelInitialText = {
    '루나 쁘띠': 'P',
    '루나 드림': 'D',
    '루나 스윗': 'S',
    '원더 블랙': 'W',
    '캐시': 'C',
    null: '',
  };

  /**----------function */
  /**-----pet stat */
  static int switchPetEquipmentStat({required String? petType}) {
    return switch (petType) {
      '루나 쁘띠' => 10,
      '루나 드림' || '루나 스윗' || '원더 블랙' => 5,
      _ => 0,
    };
  }

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
      '아크' ||
      '아델' =>
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
      '듀얼블레이더' ||
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

  static int switchUnionStat({required String stat}) {
    var type = stat.split(' ').first;
    return switch (type) {
      '보스' => 1,
      '방어율' => 2,
      '크리티컬' => 3,
      '일반' => 4,
      '버프' => 5,
      '상태' => 6,
      '스킬' => 7,
      '공격력/마력' => 8,
      '공격력' => 9,
      '마력' => 10,
      'STR,' => 11,
      'STR' => 12,
      'DEX' => 13,
      'INT' => 14,
      'LUK' => 15,
      '최대' => 16,
      '경험치' => 17,
      '메소' => 18,
      '상태' => 19,
      '소환수' => 20,
      '공격' => 21,
      '적' => 22,
      _ => 23,
    };
  }

  static int switchUnionCharacter({required String characterClass}) {
    var type = switchClassMainStat(className: characterClass);
    return switch (type) {
      'STR' => 1,
      'DEX' => 2,
      'INT' => 3,
      'LUK' => 4,
      _ => 5,
    };
  }

  static String switchUnionCardGrade(
      {required String characterClass, required String characterLevel}) {
    var cardGrade = '';
    var level = int.parse(characterLevel);
    switch (characterClass) {
      case '제로':
        if (250 <= level) {
          cardGrade = 'SSS';
        } else if (200 <= level && level < 250) {
          cardGrade = 'SS';
        } else if (180 <= level && level < 200) {
          cardGrade = 'S';
        } else if (160 <= level && level < 180) {
          cardGrade = 'A';
        } else if (130 <= level && level < 160) {
          cardGrade = 'B';
        }
      case '모바일 캐릭터':
        if (120 <= level) {
          cardGrade = 'SS';
        } else if (70 <= level && level < 120) {
          cardGrade = 'S';
        } else if (50 <= level && level < 70) {
          cardGrade = 'A';
        } else if (30 <= level && level < 50) {
          cardGrade = 'B';
        }
      default:
        if (250 <= level) {
          cardGrade = 'SSS';
        } else if (200 <= level && level < 250) {
          cardGrade = 'SS';
        } else if (140 <= level && level < 200) {
          cardGrade = 'S';
        } else if (100 <= level && level < 140) {
          cardGrade = 'A';
        } else if (60 <= level && level < 100) {
          cardGrade = 'B';
        }
    }
    return cardGrade;
  }

  static bool switchSkillIsOrigin({required String name}) {
    return switch (name) {
      '슈퍼 캐논 익스플로젼' => true,
      _ => false,
    };
  }
}
