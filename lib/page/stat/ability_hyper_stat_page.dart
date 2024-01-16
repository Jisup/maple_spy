import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/page/stat/detail/ability_detail_info_page.dart';
import 'package:maplespy/page/stat/detail/hyper_detail_info_page.dart';

class AbilityHyperStatPage extends ConsumerWidget {
  const AbilityHyperStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: StatColor.statBackground,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AbilityDetailInfoPage(),
                HyperDetailInfoPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
