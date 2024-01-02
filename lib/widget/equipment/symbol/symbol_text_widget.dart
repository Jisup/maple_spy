import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/util/make_list.dart';

class SymbolTextWidget extends ConsumerWidget {
  const SymbolTextWidget(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.subColor});

  final String text;
  final double size;
  final Color color;
  final Color subColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        shadows: eightDirectionShadow(2, subColor),
      ),
    );
  }
}
