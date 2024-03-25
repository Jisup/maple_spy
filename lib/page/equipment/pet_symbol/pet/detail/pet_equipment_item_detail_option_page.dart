import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';

class PetEquipmentItemDetailOptionPage extends ConsumerWidget {
  const PetEquipmentItemDetailOptionPage({
    super.key,
    required this.petType,
    required this.options,
  });

  final String? petType;
  final List<ItemOption> options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.map((option) {
        int basicOption =
            StaticSwitchConfig.switchPetEquipmentStat(petType: petType);
        int etcOption = int.parse(option.optionValue!) - basicOption;

        return Text.rich(TextSpan(children: [
          TextSpan(
              text: '${option.optionType} : +${option.optionValue}',
              style: TextStyle(
                  color: etcOption != 0
                      ? ItemColor.totalOptionText
                      : ItemColor.commonInfoText)),
          etcOption != 0
              ? TextSpan(children: [
                  TextSpan(
                      text: ' (${basicOption}',
                      style: const TextStyle(color: ItemColor.commonInfoText)),
                  TextSpan(
                      text: ' +${etcOption}',
                      style: const TextStyle(color: ItemColor.etcOptionText)),
                  const TextSpan(
                      text: ')',
                      style: TextStyle(color: ItemColor.commonInfoText)),
                ])
              : const TextSpan(),
        ]));
      }).toList(),
    );
  }
}
