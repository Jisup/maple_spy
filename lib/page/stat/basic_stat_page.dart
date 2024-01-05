import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/stat/stat_model.dart';
import 'package:maple_app/page/stat/detail/basic_detail_main_info_page.dart';
import 'package:maple_app/page/stat/detail/basic_detail_sub_info_page.dart';

class BasicStatPage extends ConsumerWidget {
  const BasicStatPage({super.key, required this.basicStat});

  final Stat basicStat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: StatColor.statBackgroundColor,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                  padding: EdgeInsets.only(top: DimenConfig.commonDimen),
                  color: colorScheme.primary,
                  child: BasicDetailMainInfoPage(),
                ),
                BasicDetailSubInfoPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
