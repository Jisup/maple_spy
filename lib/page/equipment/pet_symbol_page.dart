import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/model/equipment/pet/pet_detail_model.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/model/equipment/symbol_item_model.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/pet_info_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/pet_skill_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/symbol_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_select_sub_tab.dart';

class PetSymbolPage extends ConsumerWidget {
  const PetSymbolPage(
      {super.key, required this.petItem, required this.symbolItem});

  final PetItem petItem;
  final SymbolItem symbolItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    PetDetail petDetail = PetDetail(petItem: petItem);

    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      child: LayoutBuilder(
        builder:
            (BuildContext childContext, BoxConstraints viewportConstraints) =>
                ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
              minHeight: viewportConstraints.maxHeight),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /**-----pet detail info*/
                  Row(
                    children: petDetail.petList
                        .map((pet) => Expanded(child: PetInfoPage(pet: pet)))
                        .toList(),
                  ),

                  /**-----pet detail skill */
                  Row(
                    children: petDetail.petList
                        .map((pet) => Expanded(
                            child: PetSkillPage(petSkill: pet.petAutoSkill!)))
                        .toList(),
                  ),

                  /**-----devider */
                  Semantics(
                    label: '구분 선',
                    readOnly: true,
                    child: Divider(
                        height: DimenConfig.commonDimen * 2,
                        thickness: 2,
                        indent: DimenConfig.commonDimen,
                        endIndent: DimenConfig.commonDimen,
                        color: colorScheme.primary),
                  ),

                  /**-----symbol detail */
                  Container(
                    margin: EdgeInsets.only(
                        top: DimenConfig.commonDimen,
                        bottom: DimenConfig.commonDimen),
                    child: Table(
                      children: [
                        TableRow(
                          children: StaticListConfig.equipmentSymbolTabList
                              .map((tab) => DetailSelectSubTab(
                                  tab: tab,
                                  provider: equipmentSelectSymbolTabProvider))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  SymbolPage(symbolItem: symbolItem),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
