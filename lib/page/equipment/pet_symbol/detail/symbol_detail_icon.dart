import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class SymbolIconInfoWidget extends ConsumerWidget {
  const SymbolIconInfoWidget(
      {super.key, required this.imageUrl, required this.level});

  final String? imageUrl;
  final int? level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
