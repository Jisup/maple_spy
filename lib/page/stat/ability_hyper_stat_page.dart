import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/page/stat/detail/ability_detail_info_page.dart';
import 'package:maplespy/page/stat/detail/hyper_detail_info_page.dart';
import 'package:maplespy/provider/common_provider.dart';

class AbilityHyperStatPage extends ConsumerWidget {
  const AbilityHyperStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -3) {
          ref.read(statSelectTabProvider.notifier).update((state) => 'hexa');
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        color: StatColor.statBackground,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) =>
              ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
      ),
    );
  }
}
