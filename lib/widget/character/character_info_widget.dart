import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:stroke_text/stroke_text.dart';

class CharacterInfoWidget extends ConsumerWidget {
  const CharacterInfoWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.type});

  final String title;
  final String value;
  final bool type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.all(DimenConfig.subDimen),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(DimenConfig.subDimen),
              decoration: BoxDecoration(
                color: type ? colorScheme.primary : colorScheme.onSecondary,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(RadiusConfig.commonRadius)),
              ),
              child: Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen),
                child: StrokeText(
                  text: title,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: FontConfig.commonSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: SpacingConfig.commonSpacing,
                  ),
                  strokeColor: colorScheme.primary,
                  strokeWidth: StrokeConfig.commonWidth,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(DimenConfig.subDimen),
              decoration: BoxDecoration(
                color: type ? colorScheme.primary : colorScheme.onSecondary,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(RadiusConfig.commonRadius)),
              ),
              child: Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen),
                child: Text(
                  value,
                  style: TextStyle(
                    color: type ? Colors.white : Colors.black,
                    fontSize: FontConfig.commonSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
