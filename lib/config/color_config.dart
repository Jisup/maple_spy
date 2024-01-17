import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF161A30),
  onPrimary: Color(0xFFF0ECE5),
  secondary: Color(0xFF31304D),
  onSecondary: Color(0xFFB6BBC4),
  tertiary: Color(0xFFf68500),
  onTertiary: Color(0xFF3b75d2),
  error: Color(0xFFFF0000),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFF0ECE5), // Container, Widget 등의 backgroundColor 고정값
  onBackground: Color(0xFF161A30),
  surface: Color(0xFF000000), // TextStyle의 color 값
  onSurface: Color(0xFF000000), // TextFiled 내 Text의 Color 값
);

// const darkColorscheme = ColorScheme();

class CommonColor {
  static const Color main = Color(0xFFf68500);
  static const Color sub = Color(0xFF3b75d2);
  static const Color infoMain = Color(0xFF3cc1d7);
  static const Color infoSub = Color(0xFFa2cc11);
}

class EquipmentColor {
  static const Color background = Color(0xFFeeeeee); // 장비 아이템 배경
  static const Color detailBackground = Color(0xFF121318); // 장비 디테일 배경
  static const Color detailClassBackground = Color(0xFF222222); // 장비 디테일 직업 배경
  static const Color detailItemStartBackground =
      Color(0xFF666666); // 장비 디테일 아이템 시작 배경
  static const Color detailItemEndBackground =
      Color(0xFFbbbbbb); // 장비 디테일 아이템 끝 배경

  static const Color equipmentActiveBackground =
      Color(0xFFcacaca); // 장착 활성화 칸 배경
  static const Color equipmentDeactiveBackground =
      Color(0xFFacacac); // 장착 비활성화 칸 배경
  static const Color equipmentImpossibleBackground =
      Color(0xFFd6adad); // 장착 불가능 칸 배경
}

class ItemColor {
  static const Color rarePotentialBorder = Color(0xFF0099ff); // 레어 테두리
  static const Color epicPotentialBorder = Color(0xFF7700cc); // 에픽 테두리
  static const Color uniquePotentialBorder = Color(0xFFffaa00); // 유니크 테두리
  static const Color legendaryPotentialBorder = Color(0xFF77ee00); // 레전드리 테두리

  static const Color rarePotentialDetailBorder =
      Color(0xFF0099ff); // 레어 디테일 테두리
  static const Color epicPotentialDetailBorder =
      Color(0xFF7700cc); // 에픽 디테일 테두리
  static const Color uniquePotentialDetailBorder =
      Color(0xFFffaa00); // 유니크 디테일 테두리
  static const Color legendaryPotentialDetailBorder =
      Color(0xFF00cc99); // 레전드리 디테일 테두리

  static const Color commonInfoText = Color(0xFFffffff); // 공통 텍스트: 흰색
  static const Color subInfoText = Color(0xFFffcc00); // 공통 서브 텍스트: 노란색
  static const Color etcInfoText = Color(0xFFffaa00); // 공통 예외 텍스트
  static const Color deactiveOptionText = Color(0xFF777777); // 비활성화 옵션 텍스트

  static const Color rarePotentialText = Color(0xFF66ffff); // 레어 잠재능력 텍스트
  static const Color epicPotentialText = Color(0xFF9966ff); // 에픽 잠재능력 텍스트
  static const Color uniquePotentialText = Color(0xFFffcc00); // 유니크 잠재능력 텍스트
  static const Color legendaryPotentialText =
      Color(0xFFccff00); // 레전드리 잠재능력 텍스트

  static const Color rareIconTextShadow = Color(0xFF005599); // 레어 아이콘 텍스트 그림자
  static const Color epicIconTextShadow = Color(0xFF440099); // 에픽 아이콘 텍스트 그림자
  static const Color uniqueIconTextShadow =
      Color(0xFF996600); // 유니크 아이콘 텍스트 그림자
  static const Color legendaryIconTextShadow =
      Color(0xFF337700); // 레전드리 아이콘 텍스트 그림자
  static const Color iconBoxShadow = Color(0xFF777777); // 아이콘 박스 그림자

  static const Color rareIconBackground = Color(0xFF0099ff); // 레어 아이콘 배경
  static const Color epicIconBackground = Color(0xFF7700ee); // 에픽 아이콘 배경
  static const Color uniqueIconBackground = Color(0xFFff9900); // 유니크 아이콘 배경
  static const Color legendaryIconBackground = Color(0xFF77ee00); // 레전드리 아이콘 배경

  static const Color rareIconBorder = Color(0xFF005599); // 레어 아이콘 테두리
  static const Color epicIconBorder = Color(0xFF440099); // 에픽 아이콘 테두리
  static const Color uniqueIconBorder = Color(0xFF996600); // 유니크 아이콘 테두리
  static const Color legendaryIconBorder = Color(0xFF337700); // 레전드리 아이콘 테두리

  static const Color upgradeOptionText = Color(0xFFff0066); // 강화 텍스트
  static const Color totalOptionText = Color(0xFF66ffff); // 전체 옵션 텍스트
  static const Color baseOptionText = Color(0xFFffffff); // 기본 옵션 텍스트
  static const Color addOptionText = Color(0xFFccff00); // 추가 옵션 텍스트
  static const Color etcOptionText = Color(0xFFaaaaff); // 기타(주문서) 옵션 텍스트
  static const Color etcDownOptionText = Color(0xFFff0066); // 능력치 감소 텍스트
  static const Color starforceOptionText = Color(0xFFffcc00); // 스타포스 옵션 텍스트
  static const Color soulOptionText = Color(0xFFffff44); // 소울 옵션 텍스트
  // static const Color exceptionalOptionText = Color(0xFF); // 익셉셔널 옵션 텍스트
}

class CashColor {
  static const Color initialText = Color(0xFFFFFF66); // 이니셜 색상
  static const Color initialShadow = Color(0xFFEEBB00); // 이니셜 그림자
  static const Color subInitialText = Color(0xFFFFFFFF); // 서브 이니셜 색상
  static const Color subInitialShadow = Color(0xFFEEDDDD); // 서브 이니셜 그림자

  static const Color border = Color(0xFFFFDD00); // 캐시 테두리
  static const Color startBackground = Color(0xFF774400); // 캐시 시작 테두리
  static const Color endBackground = Color(0xFFFFFFFF); // 캐시 끝 테두리

  static const Color masterLabelText = Color(0xFF00CCFF); // 마스터 라벨 텍스트
  static const Color masterLabelOption = Color(0xFFF1F140); // 마스터 라벨 옵션
  static const Color masterBorder = Color(0xFF00DDFF); // 마스터 라벨 테두리
  static const Color masterStartBackground = Color(0xFF0055BB); // 마스터 라벨 시작 배경
  static const Color masterEndBackground = Color(0xFF003388); // 마스터 라벨 끝 배경

  static const Color blackLabelText = Color(0xFFffcc00); // 블랙 라벨 텍스트
  static const Color blackBorder = Color(0xFF656565); // 블랙 라벨 테두리
  static const Color blackStartBackground = Color(0xFF323232); // 블랙 라벨 시작 배경
  static const Color blackEndBackground = Color(0xFF111111); // 블랙 라벨 끝 배경

  static const Color redLabelText = Color(0xFFff0066); // 레드 라벨 텍스트
  static const Color redBorder = Color(0xFFFF3344); // 레드 라벨 테두리
  static const Color redStartBackground = Color(0xFFBB0000); // 레드 라벨 시작 배경
  static const Color redEndBackground = Color(0xFF660000); // 레드 라벨 끝 배경

  static const Color specialLabelText = Color(0xFFBBBBBB); // 스페셜 라벨 텍스트
  static const Color specialBorder = Color(0xFFBBBBBB); // 스페셜 라벨 테두리
  static const Color specialStartBackground = Color(0xFFBBAAAA); // 스페셜 라벨 시작 배경
  static const Color specialEndBackground = Color(0xFF665555); // 스페셜 라벨 끝 배경
}

class PetColor {
  static const Color text = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFFFDD00);
  static const Color startBackground = Color(0xFF774400);
  static const Color endBackground = Color(0xFFFFFFFF);

  static const Color initialText = Color(0xFFFFFFFF);
  static const Color subInitialText = Color(0xFF777766);

  static const Color wonderBorder = Color(0xFF55DDEE);
  static const Color wonderStartBackground = Color(0xFF0022EE);
  static const Color wonderEndBackground = Color(0xFF2288FF);

  static const Color wonderBlackText = Color(0xFFEEBB00);
  static const Color wonderBlackBorder = Color(0xFF777766);
  static const Color wonderBlackStartBackground = Color(0xFF333333);
  static const Color wonderBlackEndBackground = Color(0xFF000000);

  static const Color lunaSweetText = Color(0xFFEE55BB);
  static const Color lunaSweetBorder = Color(0xFFFFBBDD);
  static const Color lunaSweetStartBackground = Color(0xFF773399);
  static const Color lunaSweetEndBackground = Color(0xFFEE88CC);

  static const Color lunaDreamText = Color(0xFF00BBEE);
  static const Color lunaDreamBorder = Color(0xFF33CCDD);
  static const Color lunaDreamStartBackground = Color(0xFF221133);
  static const Color lunaDreamEndBackground = Color(0xFF1177AA);

  static const Color lunaPetitText = Color(0xFFBB77FF);
  static const Color lunaPetitBorder = Color(0xFFAA77FF);
  static const Color lunaPetitStartBackground = Color(0xFF111122);
  static const Color lunaPetitEndBackground = Color(0xFF5533CC);

  static const Color lunaStartBorder = Color(0xFFFFFF77);
  static const Color lunaMiddleBorder = Color(0xFFEFC010);
  static const Color lunaEndBorder = Color(0xFFEE8800);
}

class SymbolColor {
  static const Color startBorder = Color(0xFFf1e2a7); // 공통 장착 시작 테두리
  static const Color endBorder = Color(0xFFd9b47d); // 공통 장착 끝 테두리

  static const Color arcaneStartBackground = Color(0xFF5a5a92); // 아케인 시작 배경
  static const Color arcaneEndBackground = Color(0xFF707ab7); // 아케인 끝 배경

  static const Color authenticLeftStartBackground =
      Color(0xFF8acaf4); // 어센틱 왼쪽 시작 배경
  static const Color authenticLeftEndBackground =
      Color(0xFF79afe0); // 어센틱 왼쪽 끝 배경
  static const Color authenticRightStartBackground =
      Color(0xFF73a6db); // 어센틱 오른쪽 시작 배경
  static const Color authenticRightEndBackground =
      Color(0xFF638fd7); // 어센틱 오른쪽 끝 배경
  static const Color authenticStartBackground = Color(0xFF6a96cb); // 어센틱 시작 배경
  static const Color authenticEndBackground = Color(0xFF8d8fd8); // 어센틱 끝 배경
}

class SkillColor {
  static const Color startBackground = Color(0xFFd2d5d7); // 공통 시작 배경
  static const Color endBackground = Color(0xFFbec5c9); // 공통 끝 배경
  static const Color background = Color(0xFF9099a3); // 공통 배경

  static const Color border = Color(0xFF9aa3a7); // 공통 테두리
  static const Color subBorder = Color(0xFFe8e9ea); // 공통 서브 테두리

  static const Color hexaCoreStartBackground =
      Color(0xFF666699); // 공용(6차) 코어 배경 시작 색상
  static const Color hexaCoreEndBackground =
      Color(0xFF99aadd); // 공용(6차) 코어 배경 끝 색상
  static const Color hexaSkillCoreStartBackground =
      Color(0xFF5522cc); // 스킬(6차) 코어 배경 시작 색상
  static const Color hexaSkillCoreEndBackground =
      Color(0xFFbb88ee); // 스킬(6차) 코어 배경 끝 색상
  static const Color hexaEnhanceCoreStartBackground =
      Color(0xFF882266); // 강화(6차의 5차) 코어 배경 시작 색상
  static const Color hexaEnhanceCoreEndBackground =
      Color(0xFFdd77cc); // 강화(6차의 5차) 코어 배경 끝 색상
  static const Color hexaMasteryCoreStartBackground =
      Color(0xFF336699); // 마스터리(6차의 4차) 코어 배경 시작 색상
  static const Color hexaMasteryCoreEndBackground =
      Color(0xFF77ccdd); // 마스터리(6차의 4차) 코어 배경 끝 색상

  static const Color hexaCoreBorder = Color(0xFF556699); // 공용(6차) 코어 테두리 색상
  static const Color hexaSkillCoreBorder =
      Color(0xFF6622cc); // 스킬(6차) 코어 테두리 색상
  static const Color hexaEnhanceCoreBorder =
      Color(0xFF772255); // 강화(6차의 5차) 코어 테두리 색상
  static const Color hexaMasteryCoreBorder =
      Color(0xFF226699); // 마스터리(6차의 4차) 코어 테두리 색상

  static const Color vSkillCoreStartBackground =
      Color(0xFF115577); // 스킬(5차) 코어 배경 시작 색상
  static const Color vSkillCoreEndBackground =
      Color(0xFF227799); // 스킬(5차) 코어 배경 끝 색상
  static const Color vMasteryCoreStartBackground =
      Color(0xFF334444); // 강화(4차) 코어 배경 시작 색상
  static const Color vMasteryCoreEndBackground =
      Color(0xFF556677); // 강화(4차) 코어 배경 끝 색상
}

class StatColor {
  static const Color statTitle = Color(0xFFDDFF00); // 스탯 제목 색상
  static const Color statBackground = Color(0xFF6B7785); // 스텟 배경 색상
  static const Color divider = Color(0xFFf1e2a7); // 스텟 나눔 막대 색상

  static const Color statRareBackground = Color(0xFF36b8d0); // 스텟 레어 배경 색상

  static const Color statEpicBackground = Color(0xFF7f66d3); // 스텟 에픽 배경 색상
  static const Color statEpicStartBackground =
      Color(0xFF7D64D0); // 스텟 에픽 시작 배경 색상
  static const Color statEpicEndBackground = Color(0xFF6751B3); // 스텟 에픽 끝 배경 색상
  static const Color statEpicBorder = Color(0xFF55419B); // 스텟 에픽 그림자 색상

  static const Color statUniqueBackground = Color(0xFFe89c09); // 스텟 유니크 배경 색상
  static const Color statUniqueStartBackground =
      Color(0xFFf2b40e); // 스텟 유니크 시작 배경 색상
  static const Color statUniqueEndBackground =
      Color(0xFFe89d09); // 스텟 유니크 끝 배경 색상
  static const Color statUniqueBorder = Color(0xFFBA7C04); // 스텟 유니크 그림자 색상

  static const Color statLegendaryBackground = Color(0xFFa4c700); // 스텟 레전드리 색상
  static const Color statLegendaryStartBackground =
      Color(0xFFA4C206); // 스텟 레전드리 시작 배경 색상
  static const Color statLegendaryEndBackground =
      Color(0xFF84A811); // 스텟 레전드리 끝 배경 색상
  static const Color statLegendaryBorder = Color(0xFF5D8D0A); // 스텟 레전드리 그림자 색상

  static const Color statHexaStartBackground =
      Color(0xFF182848); // 헥사 스텟 시작 배경 색상
  static const Color statHexaMiddleBackground =
      Color(0xFF373577); // 헥사 스텟 중간 배경 색상
  static const Color statHexaEndBackground = Color(0xFF224466); // 헥사 스텟 끝 배경 색상

  static const Color statHexaStartText = Color(0xFF51859C); // 헥사 스텟 시작 텍스트 색상
  static const Color statHexaEndText = Color(0xFF6969AA); // 헥사 스텟 끝 텍스트 색상

  static const Color statHexaBorder = Color(0xFF112233); // 헥사 스텟 테두리 색상
  static const Color statHexaSubBorder = Color(0xFF3B7B9B); // 헥사 스텟 서브 테두리 색상

  static const Color statHexaText = Color(0xFF7799AA); // 스텟 외부 텍스트 색상
  static const Color statHexaMainText = Color(0xFFeeddff); // 헥사 스텟 메인 텍스트 색상
  static const Color statHexaAdditionalText =
      Color(0xFFccffff); // 헥사 스텟 에디셔널 텍스트 색상
}
