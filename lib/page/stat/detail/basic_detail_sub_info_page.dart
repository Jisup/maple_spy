import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/controller/stat_controller.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

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
                                    text: StatController.getStatValue(stat),
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
                Semantics(
                  label: '구분 선',
                  readOnly: true,
                  child: Divider(
                    color: StatColor.divider,
                    height: DimenConfig.commonDimen * 2,
                    thickness: 2,
                    indent: DimenConfig.commonDimen * 2,
                    endIndent: DimenConfig.commonDimen * 2,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
