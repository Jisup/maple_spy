import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/controller/stat_controller.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class BasicDetailSubInfoPage extends ConsumerWidget {
  const BasicDetailSubInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: StaticListConfig.statAllList
          .map(
            (statList) => Column(
              children: [
                Wrap(
                  runSpacing: DimenConfig.subDimen,
                  children: statList
                      .map(
                        (stat) => Container(
                          margin: EdgeInsets.only(
                              left: DimenConfig.maxDimen,
                              right: DimenConfig.maxDimen),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: CustomTextWidget(
                                    text: stat,
                                    size: FontConfig.commonSize,
                                    color: Colors.white,
                                    subColor: Colors.black26,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: CustomTextWidget(
                                    text: switch (stat) {
                                      '스탯 공격력\n' =>
                                        '${StatController.findStatValue('최소 스탯공격력')}\n~ ${StatController.findStatValue('최대 스탯공격력')}',
                                      '재사용 대기시간 감소' =>
                                        '${StatController.findStatValue('재사용 대기시간 감소 (초)')} / ${StatController.findStatValue('재사용 대기시간 감소 (%)')}',
                                      _ => StatController.findStatValue(stat),
                                    },
                                    textAlign: TextAlign.right,
                                    size: FontConfig.commonSize,
                                    color: Colors.white,
                                    subColor: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                Divider(
                  color: StatColor.dividerColor,
                  height: DimenConfig.commonDimen * 2,
                  thickness: 2,
                  indent: DimenConfig.commonDimen * 2,
                  endIndent: DimenConfig.commonDimen * 2,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
