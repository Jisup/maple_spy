import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/equipment/pet_symbol/symbol/detail/symbol_detail_growth_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class SymbolImagePage extends ConsumerWidget {
  const SymbolImagePage({
    super.key,
    required this.imageUrl,
    required this.level,
    required this.growth,
    required this.require_growth,
  });

  final String? imageUrl;
  final int? level;
  final int growth;
  final int require_growth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String symbolTab = ref.read(equipmentSelectSymbolTabProvider);
    final growthStart = symbolTab == 'ARC'
        ? SymbolColor.arcaneGrowthStart
        : SymbolColor.authenticGrowthStart;
    final growthEnd = symbolTab == 'ARC'
        ? SymbolColor.arcaneGrowthEnd
        : SymbolColor.authenticGrowthEnd;

    final bool levelMax = symbolTab == 'ARC' ? level == 20 : level == 11;

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        decoration: BoxDecoration(
          border: GradientBoxBorder(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                SymbolColor.startBorder,
                SymbolColor.endBorder,
              ])),
          borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
        ),
        child: Container(
          margin: EdgeInsets.all(DimenConfig.minDimen),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.circular(
                DimenConfig.commonDimen - DimenConfig.minDimen),
          ),
          child: LayoutBuilder(
            builder: (BuildContext childContext,
                BoxConstraints viewportConstraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 105,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: DimenConfig.minDimen,
                    bottom: DimenConfig.minDimen,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: imageUrl != null
                              ? Image.network(
                                  imageUrl!,
                                  fit: BoxFit.contain,
                                  semanticLabel: '심볼 이미지',
                                )
                              : null,
                        ),
                      ),
                      level != null
                          ? CustomTextWidget(
                              text: 'Lv.${level}',
                              size: FontConfig.commonSize,
                              color: Colors.white,
                              subColor: Colors.black26,
                              shadowSize: 2,
                            )
                          : SizedBox.shrink(),
                      level != null
                          ? levelMax
                              ? ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [
                                        0.625,
                                        0.825
                                      ],
                                      colors: [
                                        Colors.white,
                                        growthEnd,
                                      ]).createShader(bounds),
                                  child: CustomTextWidget(
                                    text: 'MAX',
                                    size: FontConfig.commonSize - 1,
                                    color: Colors.white,
                                    subColor: growthStart,
                                    shadowSize: 1.5,
                                  ),
                                )
                              : SymbolDetailGrowthPage(
                                  growth: growth,
                                  require_growth: require_growth,
                                )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
