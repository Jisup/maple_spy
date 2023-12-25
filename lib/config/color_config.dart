import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF161A30),
  onPrimary: Color(0xFFF0ECE5),
  secondary: Color(0xFF31304D),
  onSecondary: Color(0xFFB6BBC4),
  error: Color(0xFFFF0000),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFF0ECE5),
  onBackground: Color(0xFF161A30),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
);

// const darkColorscheme = ColorScheme();

class ItemColor {
  static const Color background = Color(0xFFeeeeee); // 장비 아이템 배경
  static const Color detailBackground = Color(0xFF121318); // 장비 디테일 배경

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

  static const Color rarePotentialText = Color(0xFF66ffff); // 레어 잠재능력 텍스트
  static const Color epicPotentialText = Color(0xFF9966ff); // 에픽 잠재능력 텍스트
  static const Color uniquePotentialText = Color(0xFFffcc00); // 유니크 잠재능력 텍스트
  static const Color legendaryPotientialText =
      Color(0xFFccff00); // 레전드리 잠재능력 텍스트

  // static const Color enhanceOptionText = Color(0xFFff0066); // 강화 텍스트
  static const Color totalOptionText = Color(0xFFffffff); // 전체 옵션 텍스트
  static const Color baseOptionText = Color(0xFFffffff); // 기본 옵션 텍스트
  // static const Color exceptionalOptionText = Color(0xFF); // 익셉셔널 옵션 텍스트
  static const Color addOptionText = Color(0xFFccff00); // 추가 옵션 텍스트
  static const Color etcOptionText = Color(0xFFaaaaff); // 기타(주문서) 옵션 텍스트
  static const Color starforceOptionText = Color(0xFFffcc00); // 스타포스 옵션 텍스트
  static const Color deactiveOptionText = Color(0xFF777777); // 비활성화 옵션 텍스트
}
