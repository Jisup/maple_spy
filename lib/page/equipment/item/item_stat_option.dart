import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/model/equipment/item_model.dart';

class ItemStatOption extends ConsumerWidget {
  const ItemStatOption({
    super.key,
    required this.stat,
    required this.total,
    required this.base,
    required this.add,
    required this.etc,
    required this.starforce,
  });

  final String stat;
  final String total;
  final String base;
  final String add;
  final String etc;
  final String starforce;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return total != '0'
        ? Text.rich(TextSpan(children: [
            TextSpan(
                text: '${stat} : ',
                style: TextStyle(
                    color: ItemColor.commonInfoText, fontFamily: 'Maplestory')),
            TextSpan(
                text: '+${total}',
                style: TextStyle(color: ItemColor.totalOptionText)),
            TextSpan(text: ' '),
            TextSpan(
                text: '(', style: TextStyle(color: ItemColor.commonInfoText)),
            TextSpan(
                text: '${base}',
                style: TextStyle(color: ItemColor.baseOptionText)),
            add != '0'
                ? TextSpan(children: [
                    TextSpan(text: ' '),
                    TextSpan(
                        text: '+${add}',
                        style: TextStyle(color: ItemColor.addOptionText))
                  ])
                : TextSpan(),
            int.parse(etc) > 0
                ? TextSpan(children: [
                    TextSpan(text: ' '),
                    TextSpan(
                        text: '+${etc}',
                        style: TextStyle(color: ItemColor.etcOptionText))
                  ])
                : int.parse(etc) < 0
                    ? TextSpan(children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '-${etc}',
                            style:
                                TextStyle(color: ItemColor.etcDownOptionText))
                      ])
                    : TextSpan(),
            starforce != '0'
                ? TextSpan(children: [
                    TextSpan(text: ' '),
                    TextSpan(
                        text: '+${starforce}',
                        style: TextStyle(color: ItemColor.starforceOptionText))
                  ])
                : TextSpan(),
            TextSpan(
                text: ')', style: TextStyle(color: ItemColor.commonInfoText)),
          ]))
        : SizedBox.shrink();
  }
}
