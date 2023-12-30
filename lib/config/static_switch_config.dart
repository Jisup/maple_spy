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
}
