import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/model/equipment/pet_item_model.dart';
import 'package:maple_app/model/equipment/symbol_item_model.dart';
import 'package:maple_app/page/equipment/pet_with_symbol/symbol_detail_page.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/widget/detail_page/detail_select_sub_tab.dart';

class PetWithSymbolInfo extends ConsumerWidget {
  const PetWithSymbolInfo({super.key, required this.pet, required this.symbol});

  final PetItem pet;
  final SymbolItem symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: DimenConfig.commonDimen,
                      right: DimenConfig.commonDimen),
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: DimenConfig.subDimen),
                          child: Text('01')),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: DimenConfig.subDimen,
                          children: [
                            FractionallySizedBox(
                              widthFactor: 0.75,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(color: Colors.blue),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.75,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: DimenConfig.commonDimen,
                      right: DimenConfig.commonDimen),
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: DimenConfig.subDimen),
                          child: Text('01')),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: DimenConfig.subDimen,
                          children: [
                            FractionallySizedBox(
                              widthFactor: 0.75,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(color: Colors.blue),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.75,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: DimenConfig.commonDimen,
                      right: DimenConfig.commonDimen),
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: DimenConfig.subDimen),
                          child: Text('01')),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: DimenConfig.subDimen,
                          children: [
                            FractionallySizedBox(
                              widthFactor: 0.75,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(color: Colors.blue),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.75,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      DimenConfig.commonDimen,
                      DimenConfig.subDimen,
                      DimenConfig.commonDimen,
                      DimenConfig.subDimen),
                  padding: EdgeInsets.only(
                      top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Container(color: Colors.blue)),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Container(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      DimenConfig.commonDimen,
                      DimenConfig.subDimen,
                      DimenConfig.commonDimen,
                      DimenConfig.subDimen),
                  padding: EdgeInsets.only(
                      top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Container(color: Colors.blue)),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Container(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      DimenConfig.commonDimen,
                      DimenConfig.subDimen,
                      DimenConfig.commonDimen,
                      DimenConfig.subDimen),
                  padding: EdgeInsets.only(
                      top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Container(color: Colors.blue)),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Container(
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Container(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          /**-----symbol detail */
          Divider(
              height: DimenConfig.commonDimen * 2,
              thickness: 2,
              indent: DimenConfig.commonDimen,
              endIndent: DimenConfig.commonDimen,
              color: colorScheme.onPrimary),
          Container(
            child: Table(
              children: [
                TableRow(
                  children: StaticListConfig.equipmentSymbolTabList
                      .map((tab) => DetailSelectSubTab(
                          tab: tab, provider: equipmentSelectSymbolTabProvider))
                      .toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: SymbolDetailPage(symbolItem: symbol),
          ),
        ],
      ),
    );
  }
}
