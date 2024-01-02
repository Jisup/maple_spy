import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/widget/equipment/symbol/symbol_text_widget.dart';

class SymbolInfoWidget extends ConsumerWidget {
  const SymbolInfoWidget({super.key, required this.title, required this.stat});

  final String title;
  final String stat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(DimenConfig.commonDimen),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SymbolTextWidget(
              text: title,
              size: FontConfig.middleDownSize,
              color: Colors.white,
              subColor: Colors.black26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SymbolTextWidget(
                  text: '+',
                  size: FontConfig.middleDownSize,
                  color: Colors.white,
                  subColor: Colors.black26),
              SymbolTextWidget(
                  text: stat,
                  size: FontConfig.middleDownSize,
                  color: Colors.white,
                  subColor: Colors.black26),
            ],
          )
        ],
      ),
    );
  }
}
