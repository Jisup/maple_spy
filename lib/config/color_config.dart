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
  static const Color mainColor = Color(0xFFf68500);
  static const Color subColor = Color(0xFF3b75d2);
  static const Color infoMainColor = Color(0xFF3cc1d7);
  static const Color infoSubColor = Color(0xFFa2cc11);
}

class ItemColor {
  static const Color background = Color(0xFFeeeeee); // 장비 아이템 배경
  static const Color detailBackground = Color(0xFF121318); // 장비 디테일 배경
  static const Color detailClassBackground = Color(0xFF222222); // 장비 디테일 직업 배경

  static const Color equipmentActiveBackground =
      Color(0xFFcacaca); // 장착 활성화 칸 배경
  static const Color equipmentDeactiveBackground =
      Color(0xFFacacac); // 장착 비활성화 칸 배경
  static const Color equipmentImpossibleBackground =
      Color(0xFFd6adad); // 장착 불가능 칸 배경

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
