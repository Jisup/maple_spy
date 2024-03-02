import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/skill_hexa_notifier.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class HexaSkillPage extends ConsumerWidget {
  const HexaSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final asyncHexaNotifier = ref.read(asyncSkillHexaProvider.notifier);
    final hexaSkill = ref.watch(asyncHexaNotifier.hexaSkillProvider);
    final hexaMatrix = ref.watch(asyncHexaNotifier.hexaMatrixProvider);
    final hexaDetail = ref.watch(asyncHexaNotifier.hexaDetailProvider);

    return Container(
        margin: EdgeInsets.only(
          left: DimenConfig.commonDimen,
          right: DimenConfig.commonDimen,
        ),
        padding: EdgeInsets.only(
          left: DimenConfig.commonDimen,
          right: DimenConfig.commonDimen,
        ),
        child: LayoutBuilder(
            builder: (BuildContext context,
                    BoxConstraints viewportConstraints) =>
                SingleChildScrollView(
                    controller: ref
                        .read(skillControllerProvider.notifier)
                        .scrollController,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: hexaMatrix.characterHexaCoreEquipment != null &&
                              hexaMatrix.characterHexaCoreEquipment?.length != 0
                          ? Container(
                              margin: EdgeInsets.only(
                                  bottom: DimenConfig.maxDimen / 2),
                              child: Wrap(
                                runSpacing: DimenConfig.commonDimen,
                                children: hexaMatrix!
                                    .characterHexaCoreEquipment!
                                    .map((core) {
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
                                      borderRadius: BorderRadius.circular(
                                          DimenConfig.commonDimen),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          DimenConfig.commonDimen),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white70,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            DimenConfig.commonDimen),
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
                                                      type:
                                                          'skill_three_divide',
                                                      startColor: StaticSwitchConfig
                                                              .hexaCoreStartBackgroundColor[
                                                          core.hexaCoreType]!,
                                                      endColor: StaticSwitchConfig
                                                              .hexaCoreEndBackgroundColor[
                                                          core.hexaCoreType]!,
                                                      borderColor: StaticSwitchConfig
                                                              .hexaCoreBorderColor[
                                                          core.hexaCoreType]!),

                                                  /**-----heax skill icon */
                                                  child: hexaDetail.containsKey(
                                                              core
                                                                  .linkedSkill![
                                                                      0]
                                                                  .hexaSkillId) &&
                                                          hexaDetail[core
                                                                  .linkedSkill![
                                                                      0]
                                                                  .hexaSkillId] !=
                                                              ''
                                                      ? Container(
                                                          padding: EdgeInsets
                                                              .all(DimenConfig
                                                                  .commonDimen),
                                                          child: Image.network(
                                                            hexaDetail[core
                                                                .linkedSkill![0]
                                                                .hexaSkillId]!,
                                                            fit: BoxFit.contain,
                                                            semanticLabel:
                                                                '헥사 코어 이미지',
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
                                                        left: DimenConfig
                                                            .commonDimen),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              FractionallySizedBox(
                                                            widthFactor: 1,
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                bottom:
                                                                    DimenConfig
                                                                        .subDimen,
                                                              ),
                                                              decoration:
                                                                  customBoxDecoration(
                                                                type:
                                                                    'skill_in_out_bar',
                                                                startColor: StaticSwitchConfig
                                                                        .hexaCoreStartBackgroundColor[
                                                                    core.hexaCoreType]!,
                                                                endColor: StaticSwitchConfig
                                                                        .hexaCoreEndBackgroundColor[
                                                                    core.hexaCoreType]!,
                                                                borderColor:
                                                                    StaticSwitchConfig
                                                                            .hexaCoreBorderColor[
                                                                        core.hexaCoreType]!,
                                                              ),
                                                              child:
                                                                  CustomTextWidget(
                                                                text: core
                                                                        .linkedSkill?[
                                                                            0]
                                                                        .hexaSkillId ??
                                                                    '',
                                                                size: FontConfig
                                                                    .commonSize,
                                                                color: Colors
                                                                    .white,
                                                                subColor:
                                                                    colorScheme
                                                                        .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              FractionallySizedBox(
                                                            widthFactor: 1,
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  CustomTextWidget(
                                                                text: core
                                                                    .hexaCoreLevel!
                                                                    .toString(),
                                                                size: FontConfig
                                                                    .middleSize,
                                                                color: Colors
                                                                    .white,
                                                                subColor:
                                                                    colorScheme
                                                                        .primary,
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
                              ),
                            )
                          : MainErrorPage(
                              message: ErrorMessageConfig
                                  .hexaSkillPageVariableError),
                    ))));
  }
}
