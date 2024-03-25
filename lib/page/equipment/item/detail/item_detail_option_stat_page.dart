import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/model/equipment/item/item_detail_stat_model.dart';

class ItemDetailOptionStatPage extends ConsumerWidget {
  const ItemDetailOptionStatPage(
      {super.key, required this.detailStat, this.percentOption});

  final ItemDetailStat detailStat;
  final bool? percentOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return detailStat.total != '0'
        ? Text.rich(
            TextSpan(
              children: [
                /**-----stat */
                TextSpan(
                    text: '${detailStat.stat} : ',
                    style: TextStyle(
                        color: detailStat.total != detailStat.base &&
                                (percentOption ?? true)
                            ? ItemColor.totalOptionText
                            : ItemColor.commonInfoText)),

                /**-----total */
                TextSpan(
                    text:
                        '+${detailStat.total}${detailStat.percent! ? '%' : ''}',
                    style: TextStyle(
                        color: detailStat.total != detailStat.base &&
                                (percentOption ?? true)
                            ? ItemColor.totalOptionText
                            : ItemColor.commonInfoText)),

                /**-----open bracket */
                detailStat.total != detailStat.base &&
                        (percentOption ?? true) &&
                        (detailStat.add != null || detailStat.add != '0') &&
                        (detailStat.etc != null || detailStat.etc != '0') &&
                        (detailStat.starforce != null ||
                            detailStat.starforce != '0')
                    ? const TextSpan(children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '(',
                            style: TextStyle(color: ItemColor.commonInfoText)),
                      ])
                    : const TextSpan(),

                /**-----base */
                detailStat.total != detailStat.base && (percentOption ?? true)
                    ? TextSpan(children: [
                        TextSpan(
                            text:
                                '${detailStat.base}${detailStat.percent! ? '%' : ''}',
                            style: TextStyle(color: ItemColor.baseOptionText)),
                      ])
                    : const TextSpan(),

                /**-----add */
                detailStat.add != null && detailStat.add != '0'
                    ? TextSpan(children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                            text:
                                '+${detailStat.add}${detailStat.percent! ? '%' : ''}',
                            style: TextStyle(color: ItemColor.addOptionText))
                      ])
                    : const TextSpan(),

                /**-----etc */
                detailStat.etc != null && detailStat.etc != '0'
                    ? TextSpan(children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                            text:
                                '${int.parse(detailStat.etc!) > 0 ? '+' : ''}${detailStat.etc}',
                            style: TextStyle(
                                color: int.parse(detailStat.etc!) > 0
                                    ? ItemColor.etcOptionText
                                    : ItemColor.etcDownOptionText))
                      ])
                    : const TextSpan(),

                /**-----starforce */
                detailStat.starforce != null && detailStat.starforce != '0'
                    ? TextSpan(children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                            text: '+${detailStat.starforce}',
                            style:
                                TextStyle(color: ItemColor.starforceOptionText))
                      ])
                    : const TextSpan(),

                /**-----close bracket */
                detailStat.total != detailStat.base &&
                        (percentOption ?? true) &&
                        (detailStat.add != null || detailStat.add != '0') &&
                        (detailStat.etc != null || detailStat.etc != '0') &&
                        (detailStat.starforce != null ||
                            detailStat.starforce != '0')
                    ? const TextSpan(children: [
                        TextSpan(
                            text: ')',
                            style: TextStyle(color: ItemColor.commonInfoText)),
                      ])
                    : const TextSpan(),
              ],
            ),
          )
        : Container();
  }
}
