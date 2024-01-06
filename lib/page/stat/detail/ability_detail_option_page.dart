import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/stat/ability_stat_model.dart';

class AbilityDetailOptionPage extends ConsumerWidget {
  const AbilityDetailOptionPage({super.key, required this.ability});

  final AbilityInfo? ability;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
          left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
      padding: EdgeInsets.all(DimenConfig.minDimen),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ability?.abilityGrade != null
            ? StaticSwitchConfig.statBackgroundColor[ability!.abilityGrade!]
            : StatColor.statBackgroundColor,
        borderRadius: BorderRadius.circular(RadiusConfig.minRadius),
      ),
      child: ability?.abilityValue != null
          ? Text(
              ability!.abilityValue!,
              style: TextStyle(
                fontSize: FontConfig.commonSize,
                color: Colors.white,
              ),
            )
          : Icon(
              Icons.lock,
              size: FontConfig.middleSize,
              color: Colors.white,
            ),
    );
  }
}
