import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class DetailPresetTab extends ConsumerWidget {
  const DetailPresetTab(
      {super.key,
      required this.tab,
      required this.provider,
      this.size,
      this.color,
      required this.isBright});

  final dynamic tab;
  final StateProvider<String> provider;
  final double? size;
  final Color? color;
  final bool isBright;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var equal = tab['name'] == ref.watch(provider);
    return GestureDetector(
      onTap: equal
          ? null
          : () => ref.read(provider.notifier).update((state) => tab['name']),
      child: Container(
        width: size ?? 30,
        height: size ?? 30,
        margin: EdgeInsets.only(left: DimenConfig.commonDimen),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: equal ? color ?? colorScheme.primary : colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(RadiusConfig.minRadius),
        ),
        child: isBright
            ? CustomTextWidget(
                text: tab['text'],
                size: FontConfig.commonSize,
                color: equal ? Colors.black : Colors.black,
                subColor: equal ? Colors.white70 : Colors.white70,
              )
            : CustomTextWidget(
                text: tab['text'],
                size: FontConfig.commonSize,
                color: equal ? Colors.white : Colors.black,
                subColor: equal ? Colors.black26 : Colors.white70,
              ),
      ),
    );
  }
}
