import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      padding: EdgeInsets.only(
        top: DimenConfig.minDimen,
        bottom: DimenConfig.minDimen,
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: StaticSwitchConfig.statBackgroundColor[ability!.abilityGrade!],
        borderRadius: BorderRadius.circular(RadiusConfig.minRadius),
      ),
      child: Text(
        ability!.abilityValue!,
        style: TextStyle(
          fontSize: FontConfig.commonSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
