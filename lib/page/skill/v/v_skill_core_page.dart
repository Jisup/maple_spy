import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/skill_info_model.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/page/skill/v/v_skill_part_view.dart';
import 'package:maplespy/page/skill/v/v_skill_whole_view.dart';
import 'package:maplespy/provider/common_provider.dart';
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
    final skillToggle = ref.watch(skillToggleProvider);

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
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: DimenConfig.commonDimen,
                  runSpacing: DimenConfig.commonDimen + DimenConfig.subDimen,
                  alignment: WrapAlignment.start,
                  children: vSkillCore!.reversed.map(
                    (core) {
                      return GestureDetector(
                        onTap: () => context.push('/skill/detail',
                            extra: SkillInfo(
                              name: core.skillName,
                              icon: core.skillIcon,
                              level: core.skillLevel,
                              slotLevel: vDetail[core.skillName]?.slotLevel,
                              description:
                                  core.skillDescription?.split('\n\n').first,
                              subDescription: (core.skillDescription ?? '')
                                      .contains('\n\n')
                                  ? core.skillDescription?.split('\n\n').last
                                  : null,
                              effect: core.skillEffect,
                            )),
                        behavior: HitTestBehavior.translucent,
                        child: skillToggle
                            ? VSkillWholeView(
                                core: core,
                                vDetail: vDetail,
                              )
                            : VSkillPartView(
                                core: core,
                                vDetail: vDetail,
                              ),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
