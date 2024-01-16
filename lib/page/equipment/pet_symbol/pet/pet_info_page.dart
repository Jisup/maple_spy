import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/pet/pet_detail_model.dart';
import 'package:maplespy/widget/equipment/equipment_slot_widget.dart';

class PetInfoPage extends ConsumerWidget {
  const PetInfoPage({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
          left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
      padding: EdgeInsets.all(DimenConfig.subDimen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: DimenConfig.subDimen,
              children: [
                GestureDetector(
                  onTap: pet.petName != null
                      ? () => context.push('/equipment/pet/detail', extra: pet)
                      : null,
                  child: FractionallySizedBox(
                    widthFactor: 0.75,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: EquipmentSlotWidget(
                        name: 'PET',
                        imageUrl: pet.petIcon,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: pet.petEquipment != null
                      ? () => context.push(
                          '/equipment/pet/equipment/item/detail',
                          extra: pet.petEquipment)
                      : null,
                  child: FractionallySizedBox(
                    widthFactor: 0.75,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: EquipmentSlotWidget(
                        name: 'PET\nACC',
                        imageUrl: pet.petEquipment?.itemIcon,
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
