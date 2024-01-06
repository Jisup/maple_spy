import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/stat_controller.dart';
import 'package:maplespy/page/stat/detail/ability_detail_grade_page.dart';
import 'package:maplespy/page/stat/detail/ability_detail_option_page.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class AbilityDetailInfoPage extends ConsumerWidget {
  const AbilityDetailInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            padding: EdgeInsets.only(
              left: DimenConfig.commonDimen * 2,
              right: DimenConfig.commonDimen * 2,
              top: DimenConfig.subDimen,
              bottom: DimenConfig.subDimen,
            ),
            color: colorScheme.primary,
            child: CustomTextWidget(
                text: 'ABILITY',
                size: FontConfig.middleSize,
                color: StatColor.statTitleColor),
          ),
        ),
        Container(
          margin: EdgeInsets.all(DimenConfig.commonDimen),
          padding: EdgeInsets.only(
              top: DimenConfig.commonDimen, bottom: DimenConfig.commonDimen),
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          ),
          child: Column(
            children: [
              AbilityDetailGradePage(
                grade: StatController.abilityStat.abilityGrade,
              ),
              Wrap(
                runSpacing: DimenConfig.minDimen,
                children: [
                  for (var i = 1; i <= 3; i++)
                    AbilityDetailOptionPage(
                      ability: StatController.findAbilityInfo(i),
                    )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
