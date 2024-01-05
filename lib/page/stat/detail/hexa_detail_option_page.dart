import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class HexaDetailOptionPage extends ConsumerWidget {
  const HexaDetailOptionPage(
      {super.key,
      required this.statName,
      required this.statValue,
      this.textColor});

  final String statName;
  final String statValue;
  final Color? textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: statName,
            size: FontConfig.middleSize,
            color: textColor ?? Colors.white,
            subColor: Colors.black26,
          ),
          CustomTextWidget(
            text: statValue,
            size: FontConfig.middleSize,
            color: Colors.white,
            subColor: Colors.black26,
          ),
        ],
      ),
    );
  }
}
