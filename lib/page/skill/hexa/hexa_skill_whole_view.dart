import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/provider/skill_hexa_notifier.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class HexaSkillWholeView extends ConsumerWidget {
  const HexaSkillWholeView({
    super.key,
    required this.name,
    required this.level,
    required this.type,
  });

  final String name;
  final int level;
  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final asyncHexaNotifier = ref.read(asyncSkillHexaProvider.notifier);
    final hexaDetail = ref.watch(asyncHexaNotifier.hexaDetailProvider);

    return LayoutBuilder(
      builder: (childContext, viewportConstraints) {
        return Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  SkillColor.startBackground,
                  SkillColor.endBackground,
                ]),
            border: Border.all(
              color: SkillColor.border,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
          ),
          child: Container(
            height:
                (viewportConstraints.maxWidth - DimenConfig.commonDimen * 3) /
                        4 -
                    DimenConfig.subDimen,
            padding: EdgeInsets.all(DimenConfig.subDimen),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white70,
              ),
              borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
            ),
            child: Row(
              children: [
                FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    decoration: customBoxDecoration(
                        type: 'skill_three_divide',
                        startColor: StaticSwitchConfig
                            .hexaCoreStartBackgroundColor[type]!,
                        endColor: StaticSwitchConfig
                            .hexaCoreEndBackgroundColor[type]!,
                        borderColor:
                            StaticSwitchConfig.hexaCoreBorderColor[type]!),

                    /**-----heax skill icon */
                    child: hexaDetail.containsKey(name) &&
                            hexaDetail[name] != ''
                        ? Container(
                            padding: EdgeInsets.all(DimenConfig.middleDimen),
                            child: Image.network(
                              hexaDetail[name]!,
                              fit: BoxFit.contain,
                              semanticLabel: '헥사 코어 이미지',
                            ),
                          )
                        : null,
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: DimenConfig.commonDimen),
                      child: Column(
                        children: [
                          Expanded(
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  left: DimenConfig.commonDimen,
                                  right: DimenConfig.commonDimen,
                                ),
                                decoration: customBoxDecoration(
                                  type: 'skill_in_out_bar',
                                  startColor: StaticSwitchConfig
                                      .hexaCoreStartBackgroundColor[type]!,
                                  endColor: StaticSwitchConfig
                                      .hexaCoreEndBackgroundColor[type]!,
                                  borderColor: StaticSwitchConfig
                                      .hexaCoreBorderColor[type]!,
                                ),
                                child: CustomTextWidget(
                                  text: name,
                                  size: FontConfig.middleDownSize,
                                  color: Colors.white,
                                  subColor: colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: CustomTextWidget(
                                  text: level.toString(),
                                  size: FontConfig.middleDownSize,
                                  color: Colors.white,
                                  subColor: colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
