import 'package:flutter/material.dart';
import 'package:maple_app/config/const_config.dart';

class StaticListConfig {
  /**-----value */
  static final List<double> threeDivideBackgroundList = [
    0.0,
    0.33,
    0.33,
    0.66,
    0.66,
    1.0,
  ];
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
  static final List<dynamic> detailEquipmentTabList = [
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
  static final List<dynamic> equipmentPresetTabList = [
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
  static final List<dynamic> equipmentSymbolTabList = [
    {
      'title': 'ARC',
      'name': '아케인심볼',
      'text': 'ARCANE',
    },
    {
      'title': 'AUT',
      'name': '어센틱심볼',
      'text': 'AUTHENTIC',
    },
  ];
  static final List<dynamic> detailStatTabList = [
    {
      'name': 'basic',
      'text': '기본 스탯',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'hexa',
      'text': 'HEXA 스탯',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'ability_hyper',
      'text': '어빌리티 /\n하이퍼 스탯',
      'fontSize': FontConfig.commonSize,
      'dimenSize': 0.0,
    },
  ];
  static final List<dynamic> detailSkillTabList = [
    {
      'name': 'hexa',
      'text': 'HEXA 코어',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'v',
      'text': 'V 코어',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'link',
      'text': '링크 스킬',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
  /**-----part */
  static final List<dynamic> equipmentItemList = [
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
  static final List<String> equipmentClassList = [
    '초보자',
    '전사',
    '마법사',
    '궁수',
    '도적',
    '해적',
  ];
  static final List<dynamic> equipmentArcaneSymbolList = [
    {
      'name': '아케인심볼 : 소멸의 여로',
    },
    {
      'name': '아케인심볼 : 츄츄 아일랜드',
    },
    {
      'name': '아케인심볼 : 레헬른',
    },
    {
      'name': '아케인심볼 : 아르카나',
    },
    {
      'name': '아케인심볼 : 모라스',
    },
    {
      'name': '아케인심볼 : 에스페라',
    },
  ];
  static final List<dynamic> equipmentAuthenticSymbolList = [
    {
      'name': '어센틱심볼 : 세르니움',
    },
    {
      'name': '어센틱심볼 : 아르크스',
    },
    {
      'name': '어센틱심볼 : 오디움',
    },
    {
      'name': '어센틱심볼 : 도원경',
    },
    {
      'name': '어센틱심볼 : 아르테리아',
    },
    {
      'name': '어센틱심볼 : 카르시온',
    },
  ];
  static final List<String> statMainList = [
    'HP',
    'MP',
    'STR',
    'DEX',
    'INT',
    'LUK',
  ];
  static final List<List<dynamic>> statAllList = [
    [
      '보스 몬스터 데미지',
      '방어율 무시',
      '공격력',
      '마력',
    ],
    [
      '스탯 공격력',
      '크리티컬 확률',
      '크리티컬 데미지',
      '버프 지속시간',
      '속성 내성 무시',
      '상태이상 내성',
    ],
    [
      '최종 데미지',
      '데미지',
      '일반 몬스터 데미지',
      '상태이상 추가 데미지',
      '소환수 지속시간 증가',
      '재사용 대기시간 감소',
      '재사용 대기시간 미적용',
    ],
    [
      '메소 획득량',
      '아이템 드롭률',
      '추가 경험치 획득',
    ],
    [
      '스타포스',
      '아케인포스',
      '어센틱포스', // 어센틱포스를 획득하지 못했으면 deactive 상태 (흐린글자, 잠긴아이콘)
    ],
    [
      '방어력',
      '이동속도',
      '점프력',
      '스탠스',
      '공격속도',
    ],
  ];
  static final List<String> statHyperList = [
    'STR',
    'DEX',
    'INT',
    'LUK',
    'HP',
    'MP',
    'DF/TF/PP',
    '크리티컬 확률',
    '크리 데미지',
    '방어율 무시',
    '데미지',
    '보스 데미지',
    '일반 데미지',
    '상태 이상 내성',
    '공격력 / 마력',
    '획득 경험치',
    '아케인포스',
  ];
}
