import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/page/skill/detail/v_skill_detail_image_page.dart';
import 'package:maplespy/page/skill/detail/v_skill_detail_info_page.dart';
import 'package:maplespy/provider/skill_v_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class VSkillCorePage extends ConsumerWidget {
  const VSkillCorePage({
    super.key,
    required this.type,
    required this.vSkillCore,
  });

  final String type;
  final List<CharacterSkill>? vSkillCore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVNotifier = ref.read(asyncSkillVProvider.notifier);
    final vDetail = ref.watch(asyncVNotifier.vDetailProvider);

    return vSkillCore != null && vSkillCore!.isNotEmpty
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: type,
                  size: FontConfig.middleDownSize,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: DimenConfig.maxDimen / 2),
                child: Wrap(
                  runSpacing: DimenConfig.commonDimen,
                  children: vSkillCore!.reversed.map(
                    (core) {
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
                          borderRadius:
                              BorderRadius.circular(DimenConfig.commonDimen),
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
                                      child: VSkillDetailImagePage(
                                        skillDetail: vDetail[core.skillName],
                                        skillIcon: core.skillIcon!,
                                      )),
                                  Flexible(
                                    flex: 3,
                                    fit: FlexFit.tight,
                                    child: VDetailInfoPage(
                                      skillDetail: vDetail[core.skillName],
                                      skillName: core.skillName!,
                                      skillLevel: core.skillLevel!.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          )
        : SizedBox.shrink();
  }
}
