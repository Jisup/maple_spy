import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/model/equipment/item/item_detail_option_model.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_option_stat_page.dart';

class ItemDetailOptionPage extends ConsumerWidget {
  const ItemDetailOptionPage({super.key, required this.detailOption});

  final ItemDetailOption detailOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('장비분류 : ${detailOption.part!}',
            style: TextStyle(color: ItemColor.commonInfoText)),
        ItemDetailOptionStatPage(detailStat: detailOption.str!),
        ItemDetailOptionStatPage(detailStat: detailOption.dex!),
        ItemDetailOptionStatPage(detailStat: detailOption.int!),
        ItemDetailOptionStatPage(detailStat: detailOption.luk!),
        ItemDetailOptionStatPage(detailStat: detailOption.max_hp!),
        ItemDetailOptionStatPage(detailStat: detailOption.max_mp!),
        ItemDetailOptionStatPage(detailStat: detailOption.max_hp_rate!),
        ItemDetailOptionStatPage(detailStat: detailOption.max_mp_rate!),
        ItemDetailOptionStatPage(detailStat: detailOption.attack_power!),
        ItemDetailOptionStatPage(detailStat: detailOption.magic_power!),
        ItemDetailOptionStatPage(detailStat: detailOption.armor!),
        ItemDetailOptionStatPage(detailStat: detailOption.speed!),
        ItemDetailOptionStatPage(detailStat: detailOption.jump!),
        ItemDetailOptionStatPage(detailStat: detailOption.boss_damage!),
        ItemDetailOptionStatPage(
            detailStat: detailOption.ignore_monster_armor!),
        ItemDetailOptionStatPage(detailStat: detailOption.all_stat!),
        ItemDetailOptionStatPage(detailStat: detailOption.damage!),
        detailOption.scrollUpgarde != '0' ||
                detailOption.scrollUpgradeableCount != '0' ||
                detailOption.scrollResilienceCount != '0'
            ? Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text:
                            '업그레이드 가능 횟수 : ${detailOption.scrollUpgradeableCount!}',
                        style: TextStyle(color: ItemColor.commonInfoText)),
                    TextSpan(text: ' '),
                    TextSpan(
                        text:
                            '(복구 가능 횟수 : ${detailOption.scrollResilienceCount!})',
                        style: TextStyle(color: ItemColor.subInfoText)),
                  ],
                ),
              )
            : SizedBox.shrink(),
        detailOption.goldenHammerFlag != '미적용'
            ? Text.rich(TextSpan(
                text: '황금망치 재련 적용',
                style: TextStyle(color: ItemColor.commonInfoText)))
            : SizedBox.shrink(),
        detailOption.cuttableCount != '255'
            ? Text.rich(TextSpan(
                text: '가위 사용 가능 횟수 : ${detailOption.cuttableCount!}회',
                style: TextStyle(color: ItemColor.subInfoText)))
            : SizedBox.shrink(),
      ],
    );
  }
}
