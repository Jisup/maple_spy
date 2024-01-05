import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/equipment/symbol/symbol_detail_model.dart';
import 'package:maple_app/model/equipment/symbol_item_model.dart';
import 'package:maple_app/page/equipment/pet_symbol/detail/symbol_detail_icon.dart';
import 'package:maple_app/page/equipment/pet_symbol/detail/symbol_detail_info.dart';
import 'package:maple_app/provider/equipment_pet_symbol_notifier.dart';

class SymbolInfo extends ConsumerWidget {
  const SymbolInfo({super.key, required this.symbolItem});

  final SymbolItem symbolItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String symbolTab = ref.watch(equipmentSelectSymbolTabProvider);
    final SymbolDetail symbolDetail = SymbolDetail(symbol: symbolItem.symbol);

    return Container(
      margin: EdgeInsets.all(DimenConfig.commonDimen),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            SymbolColor.arcaneStartBackground,
            SymbolColor.arcaneEndBackground
          ],
        ),
        borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
      ),
      child: Container(
        margin: EdgeInsets.all(DimenConfig.minDimen),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(
              DimenConfig.commonDimen - DimenConfig.minDimen),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.only(
                    top: DimenConfig.commonDimen * 2,
                    bottom: DimenConfig.commonDimen * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SymbolInfoWidget(
                          title: symbolTab,
                          stat: symbolTab == 'ARC'
                              ? symbolDetail.arcaneStat.force.toString()
                              : symbolDetail.authenticStat.force.toString()),
                    ),
                    Divider(
                      color: SymbolColor.startBorder,
                      height: DimenConfig.subDimen * 2,
                      thickness: 2,
                      indent: DimenConfig.subDimen * 2,
                      endIndent: DimenConfig.subDimen,
                    ),
                    Expanded(
                      child: SymbolInfoWidget(
                          title: StaticSwitchConfig.switchClassMainStat(
                            className: symbolItem.characterClass!,
                          ),
                          stat: symbolTab == 'ARC'
                              ? symbolDetail.arcaneStat.statMain.toString()
                              : symbolDetail.authenticStat.statMain.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: DimenConfig.commonDimen * 2,
                runSpacing: DimenConfig.subDimen,
                children: (symbolTab == 'ARC'
                        ? StaticListConfig.equipmentArcaneSymbolList
                        : StaticListConfig.equipmentAuthenticSymbolList)
                    .map((tab) {
                  Symbol symbol = (symbolTab == 'ARC'
                          ? symbolDetail.arcane
                          : symbolDetail.authentic)
                      .singleWhere(
                          (element) => element.symbolName == tab['name'],
                          orElse: () => Symbol());
                  return SymbolIconInfoWidget(
                      imageUrl: symbol.symbolIcon, level: symbol.symbolLevel);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
