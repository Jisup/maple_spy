import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/stat/detail/basic_detail_main_info_page.dart';
import 'package:maplespy/page/stat/detail/basic_detail_sub_info_page.dart';

class BasicStatPage extends ConsumerWidget {
  const BasicStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: StatColor.statBackground,
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
                  child: const BasicDetailMainInfoPage(),
                ),
                const BasicDetailSubInfoPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
