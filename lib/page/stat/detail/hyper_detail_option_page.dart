import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/stat_ablity_hyper_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class HyperDetailOptionPage extends ConsumerWidget {
  const HyperDetailOptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hyperStatPreset = ref.watch(hyperStatPresetProvider);
    final asyncHyperNotifier = ref.read(asyncStatAbilityHyperProvider.notifier);

    return Container(
      margin: EdgeInsets.only(
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.maxDimen / 2,
        left: DimenConfig.maxDimen / 2,
        right: DimenConfig.maxDimen / 2,
      ),
      child: Wrap(
        children: asyncHyperNotifier
                .hyperStatPresetInfo(hyperStatPreset)
                ?.map((hyperStat) {
              var isZero = hyperStat.statLevel == 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 8,
                    fit: FlexFit.tight,
                    child: CustomTextWidget(
                      text: hyperStat.statType!,
                      size: FontConfig.commonSize,
                      color: isZero ? Colors.white : Colors.yellow,
                      subColor: Colors.black26,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Lv.',
                          size: FontConfig.commonSize,
                          color: isZero ? Colors.white : Colors.yellow,
                          subColor: Colors.black26,
                        ),
                        CustomTextWidget(
                          text: '${hyperStat.statLevel}',
                          size: FontConfig.commonSize,
                          color: isZero ? Colors.white : Colors.yellow,
                          subColor: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: hyperStat.statIncrease != null
                        ? CustomTextWidget(
                            text: '(+${hyperStat.statIncrease})',
                            textAlign: TextAlign.right,
                            size: FontConfig.subSize,
                            color: Colors.yellow,
                            subColor: Colors.black26,
                          )
                        : SizedBox.shrink(),
                  ),
                ],
              );
            }).toList() ??
            [],
      ),
    );
  }
}
