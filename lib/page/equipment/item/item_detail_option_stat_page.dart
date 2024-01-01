import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/model/equipment/item/item_detail_stat_model.dart';

class ItemDetailOptionStatPage extends ConsumerWidget {
  const ItemDetailOptionStatPage({super.key, required this.detailStat});

  final ItemDetailStat detailStat;

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
                        color: detailStat.total == detailStat.base
                            ? ItemColor.commonInfoText
                            : ItemColor.totalOptionText)),

                /**-----total */
                TextSpan(
                    text:
                        '+${detailStat.total}${detailStat.percent! ? '%' : ''}',
                    style: TextStyle(
                        color: detailStat.total == detailStat.base
                            ? ItemColor.commonInfoText
                            : ItemColor.totalOptionText)),

                /**-----open bracket */
                detailStat.total != detailStat.base &&
                        (detailStat.add != '0' || detailStat.add != null) &&
                        (detailStat.etc != '0' || detailStat.etc != null) &&
                        (detailStat.starforce != '0' ||
                            detailStat.starforce != null)
                    ? TextSpan(children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '(',
                            style: TextStyle(color: ItemColor.commonInfoText)),
                      ])
                    : TextSpan(),

                /**-----base */
                detailStat.total != detailStat.base
                    ? TextSpan(children: [
                        TextSpan(
                            text:
                                '${detailStat.base}${detailStat.percent! ? '%' : ''}',
                            style: TextStyle(color: ItemColor.baseOptionText)),
                      ])
                    : TextSpan(),

                /**-----add */
                detailStat.add != '0' && detailStat.add != null
                    ? TextSpan(children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text:
                                '+${detailStat.add}${detailStat.percent! ? '%' : ''}',
                            style: TextStyle(color: ItemColor.addOptionText))
                      ])
                    : TextSpan(),

                /**-----etc */
                detailStat.etc != '0' && detailStat.etc != null
                    ? TextSpan(children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text:
                                '${int.parse(detailStat.etc!) > 0 ? '+' : ''}${detailStat.etc}',
                            style: TextStyle(
                                color: int.parse(detailStat.etc!) > 0
                                    ? ItemColor.etcOptionText
                                    : ItemColor.etcDownOptionText))
                      ])
                    : TextSpan(),

                /**-----starforce */
                detailStat.starforce != '0' && detailStat.starforce != null
                    ? TextSpan(children: [
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '+${detailStat.starforce}',
                            style:
                                TextStyle(color: ItemColor.starforceOptionText))
                      ])
                    : TextSpan(),

                /**-----close bracket */
                detailStat.total != detailStat.base &&
                        (detailStat.add != '0' || detailStat.add != null) &&
                        (detailStat.etc != '0' || detailStat.etc != null) &&
                        (detailStat.starforce != '0' ||
                            detailStat.starforce != null)
                    ? TextSpan(children: [
                        TextSpan(
                            text: ')',
                            style: TextStyle(color: ItemColor.commonInfoText)),
                      ])
                    : TextSpan(),
              ],
            ),
          )
        : Container();
  }
}

 // Text.rich(TextSpan(children: [
        //    