import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';

class VSkillImageView extends ConsumerWidget {
  const VSkillImageView({
    super.key,
    required this.skillDetail,
    required this.skillIcon,
  });

  final VDetail? skillDetail;
  final String skillIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(DimenConfig.middleDimen),
      decoration: skillDetail != null
          ? customBoxDecoration(
              type: 'skill_in_out_square',
              startColor: StaticSwitchConfig
                  .vCoreStartBackgroundColor[skillDetail?.skillType],
              endColor: StaticSwitchConfig
                  .vCoreEndBackgroundColor[skillDetail?.skillType],
              borderColor: Colors.transparent,
            )
          : customBoxDecoration(
              type: 'equipment_no',
              startColor: SkillColor.background,
            ),

      /**-----skill icon */
      child: Image.network(
        skillIcon,
        fit: BoxFit.contain,
        semanticLabel: 'V 코어 이미지',
      ),
    );
  }
}
