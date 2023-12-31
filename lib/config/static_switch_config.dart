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

  static final potentialGradeCircleText = {
    '레전드리': 'L',
    '유니크': 'U',
    '에픽': 'E',
    '레어': 'R',
    null: '',
  };
}
