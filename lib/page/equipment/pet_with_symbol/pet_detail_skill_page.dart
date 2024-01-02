import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/equipment/pet_item_model.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';
import 'package:maple_app/widget/equipment/equipment_slot_widget.dart';

class PetDetailSkillPage extends ConsumerWidget {
  const PetDetailSkillPage({super.key, required this.petSkill});

  final PetAutoSkill petSkill;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.fromLTRB(DimenConfig.commonDimen, DimenConfig.subDimen,
          DimenConfig.commonDimen, DimenConfig.subDimen),
      padding: EdgeInsets.only(
          top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: DimenConfig.subDimen),
            child: CustomTextWidget(
              text: 'PET SKILL',
              size: FontConfig.minSize,
              color: Colors.black,
              subColor: Colors.white70,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: DimenConfig.subDimen,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      padding: EdgeInsets.all(DimenConfig.minDimen),
                      child: EquipmentSlotWidget(
                        name: 'PET',
                        imageUrl: petSkill.skill1Icon,
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      padding: EdgeInsets.all(DimenConfig.minDimen),
                      child: EquipmentSlotWidget(
                        name: 'PET',
                        imageUrl: petSkill.skill2Icon,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
