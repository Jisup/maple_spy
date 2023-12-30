import 'package:flutter/material.dart';
import 'package:maple_app/config/const_config.dart';

class StaticListConfig {
  /**-----Tab */
  static final List mainBottomNavigationTabList = [
    {
      'path': '/character',
      'name': 'character',
      'text': '캐릭터',
      'icon': Icons.person,
    },
    {
      'path': '/equipment',
      'name': 'equipment',
      'text': '장비',
      'icon': Icons.business_center_outlined,
    },
    {
      'path': '/stat',
      'name': 'stat',
      'text': '스탯',
      'icon': Icons.list_alt_rounded, // 영수증 느낌
      // 'icon': Icons.receipt_long_rounded, // 주문서 느낌
    },
    {
      'path': '/skill',
      'name': 'skill',
      'text': '스킬',
      // book icon 다시찾기
      'icon': Icons.book_outlined,
    },
  ];
  static final List detailEquipmentTabList = [
    {
      'name': 'item',
      'text': '장비',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'cash',
      'text': '캐시',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'pet/symbol',
      'text': '펫/심볼',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
  static final List equipmentPresetTabList = [
    {
      'name': 'preset1',
      'text': '프리셋 1',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'preset2',
      'text': '프리셋 2',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'preset3',
      'text': '프리셋 3',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    }
  ];
  static final List detailStatTabList = [
    {
      'name': '기본',
      'text': '기본 스탯',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'HEAX',
      'text': 'HEXA 스탯',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': '기타',
      'text': '어빌리티 /\n하이퍼 스탯',
      'fontSize': FontConfig.minSize,
      'dimenSize': 0.0,
    },
  ];
  static final List detailSkillTabList = [
    {
      'name': 'HEXAmatrix',
      'text': 'HEXA\n매트릭스',
      'fontSize': FontConfig.minSize,
      'dimenSize': 0.0,
    },
    {
      'name': 'Vmatrix',
      'text': 'V\n매트릭스',
      'fontSize': FontConfig.minSize,
      'dimenSize': 0.0,
    },
    {
      'name': 'link',
      'text': '링크 스킬',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
  /**-----part */
  static final List equipmentItemList = [
    {
      'name': 'RING',
      'slot': '반지4',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'CAP',
      'slot': '모자',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'EMBLEM',
      'slot': '엠블렘',
    },
    {
      'name': 'RING',
      'slot': '반지3',
    },
    {
      'name': 'PENDANT',
      'slot': '펜던트2',
    },
    {
      'name': 'FORE\nHEAD',
      'slot': '얼굴장식',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'BADGE',
      'slot': '뱃지',
    },
    {
      'name': 'RING',
      'slot': '반지2',
    },
    {
      'name': 'PENDANT',
      'slot': '펜던트',
    },
    {
      'name': 'EYE\nACC',
      'slot': '눈장식',
    },
    {
      'name': 'EAR\nACC',
      'slot': '귀고리',
    },
    {
      'name': 'MEDAL',
      'slot': '훈장',
    },
    {
      'name': 'RING',
      'slot': '반지1',
    },
    {
      'name': 'WEAPON',
      'slot': '무기',
    },
    {
      'name': 'CLOTHES',
      'slot': '상의',
    },
    {
      'name': 'SHOULDER',
      'slot': '어깨장식',
    },
    {
      'name': 'SUB\nWEAPON',
      'slot': '보조무기',
    },
    {
      'name': 'POCKET',
      'slot': '포켓 아이템',
    },
    {
      'name': 'BELT',
      'slot': '벨트',
    },
    {
      'name': 'PANTS',
      'slot': '하의',
    },
    {
      'name': 'GLOUES',
      'slot': '장갑',
    },
    {
      'name': 'CAPE',
      'slot': '망토',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'SHOES',
      'slot': '신발',
    },
    {
      'name': 'ANDROID',
      'slot': '안드로이드',
    },
    {
      'name': 'HEART',
      'slot': '기계 심장',
    },
  ];
  static final List equipmentCashList = [
    {
      'name': 'RING',
      'slot': '반지4',
    },
    {
      'name': 'HAIR',
      'slot': '머리',
    },
    {
      'name': 'CAP',
      'slot': '모자',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'RING',
      'slot': '반지3',
    },
    {
      'name': 'FACE\nEYE',
      'slot': '눈',
    },
    {
      'name': 'FORE\nHEAD',
      'slot': '얼굴장식',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'RING',
      'slot': '반지2',
    },
    {
      'name': 'FACE\nSKIN',
      'slot': '피부',
    },
    {
      'name': 'EYE\nACC',
      'slot': '눈장식',
    },
    {
      'name': 'EAR\nACC',
      'slot': '귀고리',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'RING',
      'slot': '반지1',
    },
    {
      'name': 'WEAPON',
      'slot': '무기',
    },
    {
      'name': 'CLOTHES',
      'slot': '상의',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'SUB\nWEAPON',
      'slot': '보조무기',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'PANTS',
      'slot': '하의',
    },
    {
      'name': 'GLOUES',
      'slot': '장갑',
    },
    {
      'name': 'CAPE',
      'slot': '망토',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': 'SHOES',
      'slot': '신발',
    },
    {
      'name': null,
      'slot': null,
    },
    {
      'name': null,
      'slot': null,
    },
  ];
}
