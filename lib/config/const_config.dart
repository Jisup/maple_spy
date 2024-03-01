/**-----padding margin */
class DimenConfig {
  static double commonDimen = 10;
  static double subDimen = 5;

  static double maxDimen = 40;
  static double minDimen = 3;
}

/**-----box */
class RadiusConfig {
  static double commonRadius = 15;
  static double subRadius = 10;

  static double maxRadius = 100;
  static double minRadius = 5;
  static double littleRadius = 3;
}

class OffsetConfig {}

/**-----text */
class FontConfig {
  static double commonSize = 15;
  static double subSize = 12;
  static double maxSize = 30;
  static double middleSize = 20;
  static double middleDownSize = 18;
  static double minSize = 9;
}

class StrokeConfig {
  static double commonWidth = 2;

  static double maxWidth = 4;
  static double minWidth = 1;
}

class SpacingConfig {
  static double commonSpacing = 1;
  static double maxSpacing = 4;
  static double minSpacing = 0.1;
}

class ErrorMessageConfig {
  static String characterPageRequestError = '캐릭터 기본 정보를\n불러오는데 실패했어요!ㅠㅠ';

  static String equipmentPageError = '장비 페이지에\n문제가 발생했어요!ㅠㅠ';
  static String itemPageRequestError = '장비 아이템 정보를\n불러오는데 실패했어요!ㅠㅠ';
  static String cashPageRequestError = '캐시 아이템 정보를\n불러오는데 실패했어요!ㅠㅠ';
  static String petSymbolRequestPageError = '펫/심볼 아이템 정보를\n불러오는데 실패했어요!ㅠㅠ';

  static String skillPageError = '스킬 페이지에\n문제가 발생했어요!ㅠㅠ';
  static String skillPageRequestError = '스킬 정보를\n불러오는데 실패했어요!ㅠㅠ';
  static String hexaSkillPageVariableError = 'Hexa 코어\n정보가 없어요!';
  static String vSkillPageVariableError = 'V 코어\n정보가 없어요!';
  static String linkSkillPageVariableError = '링크 스킬\n정보가 없어요!';

  static String statPageError = '스탯 페이지에\n문제가 발생했어요!ㅠㅠ';
  static String statPageRequestError = '스탯 정보를\n불러오는데 실패했어요!ㅠㅠ';
  static String abilityStatPageVaribaleError = 'Ability 스탯\n정보가 존재하지 않아요!';
  static String hexaStatPageVariableError = 'HEXA 스탯\n정보가 존재하지 않아요!';
}
