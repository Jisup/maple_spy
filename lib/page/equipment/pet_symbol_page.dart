import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/model/equipment/pet/pet_detail_model.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/model/equipment/symbol_item_model.dart';
import 'package:maplespy/page/equipment/pet_symbol/detail/pet_detail_info_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/detail/pet_detail_skill_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/symbol_info.dart';
import 'package:maplespy/provider/equipment_pet_symbol_notifier.dart';
import 'package:maplespy/widget/detail_page/detail_select_sub_tab.dart';

class PetSymbolPage extends ConsumerWidget {
  const PetSymbolPage({super.key, required this.pet, required this.symbol});

  final PetItem pet;
  final SymbolItem symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    PetDetail petDetail = PetDetail(petItem: pet);

    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      child: Column(
        children: [
          /**-----pet detail info*/
          Row(
            children: petDetail.petList
                .map((pet) => Expanded(child: PetDetailInfoPage(pet: pet)))
                .toList(),
          ),

          /**-----pet detail skill */
          Row(
            children: petDetail.petList
                .map((pet) => Expanded(
                    child: PetDetailSkillPage(petSkill: pet.petAutoSkill!)))
                .toList(),
          ),

          /**-----devider */
          Divider(
              height: DimenConfig.commonDimen * 2,
              thickness: 2,
              indent: DimenConfig.commonDimen,
              endIndent: DimenConfig.commonDimen,
              color: colorScheme.primary),

          /**-----symbol detail */
          Table(
            children: [
              TableRow(
                children: StaticListConfig.equipmentSymbolTabList
                    .map((tab) => DetailSelectSubTab(
                        tab: tab, provider: equipmentSelectSymbolTabProvider))
                    .toList(),
              ),
            ],
          ),
          Expanded(
            child: SymbolInfo(symbolItem: symbol),
          ),
        ],
      ),
    );
  }
}
