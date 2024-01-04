import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/skill/hexa_matrix_model.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/widget/common/custom_box_decoration_widget.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class HexaSkillPage extends ConsumerWidget {
  const HexaSkillPage(
      {super.key,
      required this.hexaSkill,
      required this.hexaDetail,
      required this.hexaMatrix});

  final Skill? hexaSkill;
  final Map<String, String> hexaDetail;
  final HexaMatrix? hexaMatrix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return hexaMatrix?.characterHexaCoreEquipment?.length != 0
        ? Wrap(
            runSpacing: DimenConfig.commonDimen,
            children: hexaMatrix!.characterHexaCoreEquipment!.map((core) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
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
                  padding: EdgeInsets.all(DimenConfig.commonDimen),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius:
                        BorderRadius.circular(DimenConfig.commonDimen),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: AspectRatio(
                      aspectRatio: 4 / 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              decoration: customBoxDecoration(
                                  type: 'three_divide',
                                  startColor: StaticSwitchConfig
                                          .hexaCoreStartBackgroundColor[
                                      core.hexaCoreType]!,
                                  endColor: StaticSwitchConfig
                                          .hexaCoreEndBackgroundColor[
                                      core.hexaCoreType]!,
                                  borderColor: StaticSwitchConfig
                                      .hexaCoreBorderColor[core.hexaCoreType]!),

                              /**-----heax skill icon */
                              child: hexaDetail.containsKey(
                                          core.linkedSkill![0].hexaSkillId) &&
                                      hexaDetail[core
                                              .linkedSkill![0].hexaSkillId] !=
                                          ''
                                  ? Container(
                                      padding: EdgeInsets.all(
                                          DimenConfig.commonDimen),
                                      child: Image.network(
                                        hexaDetail[
                                            core.linkedSkill![0].hexaSkillId]!,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: DimenConfig.commonDimen),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: FractionallySizedBox(
                                        widthFactor: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            bottom: DimenConfig.subDimen,
                                          ),
                                          decoration: customBoxDecoration(
                                            type: 'in_out_bar',
                                            startColor: StaticSwitchConfig
                                                    .hexaCoreStartBackgroundColor[
                                                core.hexaCoreType]!,
                                            endColor: StaticSwitchConfig
                                                    .hexaCoreEndBackgroundColor[
                                                core.hexaCoreType]!,
                                            borderColor: StaticSwitchConfig
                                                    .hexaCoreBorderColor[
                                                core.hexaCoreType]!,
                                          ),
                                          child: CustomTextWidget(
                                            text: core.linkedSkill?[0]
                                                    .hexaSkillId ??
                                                '',
                                            size: FontConfig.commonSize,
                                            color: Colors.white,
                                            subColor: colorScheme.primary,
                                            shadowSize: 1,
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
                                            text:
                                                core.hexaCoreLevel!.toString(),
                                            size: FontConfig.middleSize,
                                            color: Colors.white,
                                            subColor: colorScheme.primary,
                                            shadowSize: 1,
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
                  ),
                ),
              );
            }).toList(),
          )
        : MainErrorPage(message: 'Hexa 코어\n정보가 없어요!');
  }
}
