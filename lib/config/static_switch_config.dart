import 'package:flutter/material.dart';
import 'package:maple_app/config/color_config.dart';

class StaticSwitchConfig {
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
  static final potentialGradeCircleText = {
    '레전드리': 'L',
    '유니크': 'U',
    '에픽': 'E',
    '레어': 'R',
    null: '',
  };

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
