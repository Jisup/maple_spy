import 'package:maple_app/model/equipment/item/item_detail_stat_model.dart';
import 'package:maple_app/model/equipment/item_model.dart';

class ItemDetailOption {
  String? part;
  ItemDetailStat? str;
  ItemDetailStat? dex;
  ItemDetailStat? int;
  ItemDetailStat? luk;
  ItemDetailStat? max_hp;
  ItemDetailStat? max_mp;
  ItemDetailStat? max_hp_rate; // base
  ItemDetailStat? max_mp_rate; // base
  ItemDetailStat? attack_power;
  ItemDetailStat? magic_power;
  ItemDetailStat? armor;
  ItemDetailStat? speed;
  ItemDetailStat? jump;
  ItemDetailStat? boss_damage; // base, add
  ItemDetailStat? ignore_monster_armor; // base
  ItemDetailStat? all_stat; // base, add
  ItemDetailStat? damage; // base, add
  String? scrollUpgarde;
  String? scrollUpgradeableCount;
  String? scrollResilienceCount;
  String? goldenHammerFlag;
  String? cuttableCount;

  ItemDetailOption({
    required String this.part,
    required String this.scrollUpgarde,
    required ItemTotalOption itemTotalOption,
    required ItemBaseOption itemBaseOption,
    required ItemAddOption itemAddOption,
    required ItemEtcOption itemEtcOption,
    required ItemStarforceOption itemStarforceOption,
    required String this.scrollUpgradeableCount,
    required String this.scrollResilienceCount,
    required String this.goldenHammerFlag,
    required String this.cuttableCount,
  }) {
    str = ItemDetailStat(
        stat: 'STR',
        total: itemTotalOption.str!,
        base: itemBaseOption.str!,
        add: itemAddOption.str,
        etc: itemEtcOption.str,
        starforce: itemStarforceOption.str,
        percent: false);
    dex = ItemDetailStat(
        stat: 'DEX',
        total: itemTotalOption.dex!,
        base: itemBaseOption.dex!,
        add: itemAddOption.dex,
        etc: itemEtcOption.dex,
        starforce: itemStarforceOption.dex,
        percent: false);
    int = ItemDetailStat(
        stat: 'INT',
        total: itemTotalOption.int!,
        base: itemBaseOption.int!,
        add: itemAddOption.int,
        etc: itemEtcOption.int,
        starforce: itemStarforceOption.int,
        percent: false);
    luk = ItemDetailStat(
        stat: 'LUK',
        total: itemTotalOption.luk!,
        base: itemBaseOption.luk!,
        add: itemAddOption.luk,
        etc: itemEtcOption.luk,
        starforce: itemStarforceOption.luk,
        percent: false);
    max_hp = ItemDetailStat(
        stat: '최대 HP',
        total: itemTotalOption.maxHp!,
        base: itemBaseOption.maxHp!,
        add: itemAddOption.maxHp,
        etc: itemEtcOption.maxHp,
        starforce: itemStarforceOption.maxHp,
        percent: false);
    max_mp = ItemDetailStat(
        stat: '최대 MP',
        total: itemTotalOption.maxMp!,
        base: itemBaseOption.maxMp!,
        add: itemAddOption.maxMp,
        etc: itemEtcOption.maxMp,
        starforce: itemStarforceOption.maxMp,
        percent: false);
    max_hp_rate = ItemDetailStat(
      stat: '최대 HP',
      total: itemTotalOption.maxHpRate!,
      base: itemBaseOption.maxHpRate!,
      percent: true,
    );
    max_mp_rate = ItemDetailStat(
      stat: '최대 MP',
      total: itemTotalOption.maxMpRate!,
      base: itemBaseOption.maxMpRate!,
      percent: true,
    );
    attack_power = ItemDetailStat(
        stat: '공격력',
        total: itemTotalOption.attackPower!,
        base: itemBaseOption.attackPower!,
        add: itemAddOption.attackPower,
        etc: itemEtcOption.attackPower,
        starforce: itemStarforceOption.attackPower,
        percent: false);
    magic_power = ItemDetailStat(
        stat: '마력',
        total: itemTotalOption.magicPower!,
        base: itemBaseOption.magicPower!,
        add: itemAddOption.magicPower,
        etc: itemEtcOption.magicPower,
        starforce: itemStarforceOption.magicPower,
        percent: false);
    armor = ItemDetailStat(
        stat: '방어력',
        total: itemTotalOption.armor!,
        base: itemBaseOption.armor!,
        add: itemAddOption.armor,
        etc: itemEtcOption.armor,
        starforce: itemStarforceOption.armor,
        percent: false);
    speed = ItemDetailStat(
        stat: '이동속도',
        total: itemTotalOption.speed!,
        base: itemBaseOption.speed!,
        add: itemAddOption.speed,
        etc: itemEtcOption.speed,
        starforce: itemStarforceOption.speed,
        percent: false);
    jump = ItemDetailStat(
        stat: '점프력',
        total: itemTotalOption.jump!,
        base: itemBaseOption.jump!,
        add: itemAddOption.jump,
        etc: itemEtcOption.jump,
        starforce: itemStarforceOption.jump,
        percent: false);
    boss_damage = ItemDetailStat(
      stat: '보스 몬스터 공격 시 데미지',
      total: itemTotalOption.bossDamage!,
      base: itemBaseOption.bossDamage!,
      add: itemAddOption.bossDamage,
      percent: true,
    );
    ignore_monster_armor = ItemDetailStat(
      stat: '몬스터 방어율 무시',
      total: itemTotalOption.ignoreMonsterArmor!,
      base: itemBaseOption.ignoreMonsterArmor!,
      percent: true,
    );
    all_stat = ItemDetailStat(
      stat: '올스탯',
      total: itemTotalOption.allStat!,
      base: itemBaseOption.allStat!,
      add: itemAddOption.allStat,
      percent: true,
    );
    damage = ItemDetailStat(
      stat: '데미지',
      total: itemTotalOption.damage!,
      base: '0',
      add: itemAddOption.damage,
      percent: true,
    );
  }
}
