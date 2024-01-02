import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/widget/equipment/symbol/symbol_text_widget.dart';

class DetailSelectSubTab extends ConsumerWidget {
  const DetailSelectSubTab(
      {super.key, required this.tab, required this.provider});

  final dynamic tab;
  final StateProvider<String> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var equal = ref.watch(provider) == tab['title'];
    return GestureDetector(
      onTap: () => equal
          ? null
          : ref.watch(provider.notifier).update((state) => tab['title']),
      child: Container(
        margin: EdgeInsets.only(
            left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
        decoration: BoxDecoration(
          color: equal ? colorScheme.primary : colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(DimenConfig.subDimen),
        child: SymbolTextWidget(
            text: tab['text'],
            size: FontConfig.subSize,
            color: equal ? Colors.white : colorScheme.primary,
            subColor: equal ? Colors.black26 : Colors.white24),
      ),
    );
  }
}
