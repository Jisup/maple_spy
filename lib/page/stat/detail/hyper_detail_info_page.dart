import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/page/stat/detail/hyper_detail_option_page.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';
import 'package:maple_app/widget/detail_page/detail_preset_tab.dart';

final hyperStatPresetProvider = StateProvider((_) => 'preset1');

class HyperDetailInfoPage extends ConsumerWidget {
  const HyperDetailInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: DimenConfig.commonDimen * 2,
            right: DimenConfig.commonDimen * 2,
          ),
          color: colorScheme.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: DimenConfig.subDimen,
                  bottom: DimenConfig.subDimen,
                ),
                child: CustomTextWidget(
                    text: 'HYPER STAT',
                    size: FontConfig.middleSize,
                    color: StatColor.statTitleColor),
              ),
              Row(
                children: StaticListConfig.basicPresetTabList
                    .map((tab) => DetailPresetTab(
                          tab: tab,
                          provider: hyperStatPresetProvider,
                          color: StatColor.statTitleColor,
                          isBright: true,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
        HyperDetailOptionPage(),
      ],
    );
  }
}
