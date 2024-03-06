import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/util/make_list.dart';

class CustomTextWidget extends ConsumerWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    required this.size,
    this.weight,
    required this.color,
    this.subColor,
    this.shadowSize,
    this.shadowType,
  });

  final String text;
  final TextAlign? textAlign;
  final double size;
  final FontWeight? weight;
  final Color color;
  final Color? subColor;
  final double? shadowSize;
  final bool? shadowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        shadows: subColor != null
            ? shadowType != null
                ? [
                    Shadow(
                      blurRadius: RadiusConfig.commonRadius * 2,
                      color: subColor!,
                    )
                  ]
                : eightDirectionShadow(d: shadowSize ?? 1, color: subColor)
            : null,
      ),
    );
  }
}
