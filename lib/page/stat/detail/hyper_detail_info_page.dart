import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/page/stat/detail/hyper_detail_option_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';
import 'package:maplespy/widget/detail_page/detail_preset_tab.dart';

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
            top: DimenConfig.subDimen,
            bottom: DimenConfig.subDimen,
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
                    color: StatColor.statTitle),
              ),
              Row(
                children: StaticListConfig.hyperPresetTabList
                    .map((tab) => DetailPresetTab(
                          tab: tab,
                          provider: hyperStatPresetProvider,
                          color: StatColor.statTitle,
                          isBright: true,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
        const HyperDetailOptionPage(),
      ],
    );
  }
}
