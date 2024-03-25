import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/provider/common_provider.dart';

class SymbolDetailGrowthPage extends ConsumerWidget {
  const SymbolDetailGrowthPage({
    super.key,
    required this.growth,
    required this.requireGrowth,
  });

  final int growth;
  final int requireGrowth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final String symbolTab = ref.read(equipmentSelectSymbolTabProvider);

    final growthBackground = symbolTab == 'ARC'
        ? SymbolColor.arcaneGrowthBackground
        : SymbolColor.authenticGrowthBackground;
    final endBackground = symbolTab == 'ARC'
        ? SymbolColor.arcaneEndBackground
        : SymbolColor.authenticEndBackground;
    return Container(
      height: 8,
      margin: EdgeInsets.only(
        top: DimenConfig.subDimen,
        bottom: DimenConfig.subDimen,
        left: DimenConfig.minDimen,
        right: DimenConfig.minDimen,
      ),
      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
      decoration: BoxDecoration(
          color: colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          boxShadow: [
            BoxShadow(
                blurRadius: RadiusConfig.subRadius,
                offset: const Offset(1, 1),
                color: Colors.black,
                inset: true),
            BoxShadow(
                blurRadius: RadiusConfig.subRadius,
                offset: const Offset(0, 0),
                color: growthBackground,
                inset: true)
          ]),
      child: LayoutBuilder(
        builder:
            (BuildContext childContext, BoxConstraints viewportConstraints) {
          var width = viewportConstraints.maxWidth * (growth / requireGrowth);

          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        endBackground,
                      ]),
                  borderRadius:
                      BorderRadius.circular(RadiusConfig.littleRadius),
                ),
                width: width < viewportConstraints.maxWidth
                    ? width
                    : viewportConstraints.maxWidth,
                height: 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
