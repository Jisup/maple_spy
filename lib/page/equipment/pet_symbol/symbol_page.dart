import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/symbol/symbol_detail_model.dart';
import 'package:maplespy/model/equipment/symbol_item_model.dart';
import 'package:maplespy/page/equipment/pet_symbol/symbol/symbol_image_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/symbol/symbol_info_page.dart';
import 'package:maplespy/provider/common_provider.dart';

class SymbolPage extends ConsumerWidget {
  const SymbolPage({super.key, required this.symbolItem});

  final SymbolItem symbolItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String symbolTab = ref.watch(equipmentSelectSymbolTabProvider);
    final SymbolDetail symbolDetail = SymbolDetail(symbol: symbolItem.symbol);

    final startBackground = symbolTab == 'ARC'
        ? SymbolColor.arcaneStartBackground
        : SymbolColor.authenticStartBackground;
    final endBackground = symbolTab == 'ARC'
        ? SymbolColor.arcaneEndBackground
        : SymbolColor.authenticEndBackground;

    return Container(
      margin: EdgeInsets.only(
        top: DimenConfig.subDimen,
        bottom: DimenConfig.commonDimen * 2,
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startBackground, endBackground],
        ),
        borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
      ),
      child: Container(
        margin: EdgeInsets.all(DimenConfig.minDimen),
        padding: EdgeInsets.only(
          top: DimenConfig.subDimen,
          bottom: DimenConfig.subDimen,
        ),
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
                    SymbolInfoPage(
                        title: symbolTab,
                        stat: symbolTab == 'ARC'
                            ? symbolDetail.arcaneStat.force.toString()
                            : symbolDetail.authenticStat.force.toString()),
                    Semantics(
                      label: '구분 선',
                      readOnly: true,
                      child: Divider(
                        color: SymbolColor.startBorder,
                        height: DimenConfig.commonDimen * 2,
                        thickness: 2,
                        indent: DimenConfig.subDimen * 2,
                        endIndent: DimenConfig.subDimen,
                      ),
                    ),
                    SymbolInfoPage(
                        title: StaticSwitchConfig.switchClassMainStat(
                          className: symbolItem.characterClass!,
                        ),
                        stat: symbolTab == 'ARC'
                            ? symbolDetail.arcaneStat.statMain.toString()
                            : symbolDetail.authenticStat.statMain.toString()),
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
                  return Semantics(
                    label: symbol.symbolName != null
                        ? '${symbol.symbolName} 심볼'
                        : ' 비어있음',
                    child: SymbolImagePage(
                      imageUrl: symbol.symbolIcon,
                      level: symbol.symbolLevel,
                      growth: symbol.symbolGrowthCount ?? 0,
                      require_growth: symbol.symbolRequireGrowthCount ?? 1,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
