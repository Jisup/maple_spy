import 'package:flutter/material.dart';
import 'package:maplespy/config/const_config.dart';

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
  static final List<dynamic> serviceInformationList = [
    {
      'header': '※ 본 애플리케이션은\n',
      'main': '',
      'footer': '상업적 용도로 이용되지 않습니다.',
    },
    {
      'header': '※ 본 애플리케이션은\n',
      'main': 'NEXON의 공식 애플리케이션이 아니며,\n',
      'footer': '어떠한 보증도 제공하지 않습니다.',
    },
    {
      'header': '※ 본 애플리케이션은\n',
      'main': 'NEXON OPEN API',
      'footer': '에서 제공되는 메이플스토리 게임 데이터를 기반으로 제작되었습니다.',
    },
    {
      'header': '※ 본 애플리케이션에는\n',
      'main': '메이플스토리가 제공',
      'footer': '한 메이플스토리 서체가 적용되어 있습니다.',
    },
    {
      'header': '※ 본 애플리케이션에는\n',
      'main': '문화체육부의 세종대왕기념사업회가 제공',
      'footer': '한 돋움 서체가 적용되어 있습니다.',
    },
    {
      'header': '※ 본 애플리케이션의 별 이미지는\n',
      'main': 'MaterialIcons의 Kid Star',
      'footer': '를 참고하여 제작되었습니다.',
    },
    {
      'header': '※ 본 애플리케이션의 메인 아이콘(버섯)은\n"iconfinder.com"에서\n',
      'main': '"deviantart.com/jommans" 저작자',
      'footer': '가 공개한 아이콘입니다.',
    },
    {
      'header': '※ 본 애플리케이션의 우주 배경 이미지는\n"pixabay.com"의\n',
      'main': '"pixabay.com/ko/users/felixmittermeier-4397258" 저작자',
      'footer': '가 공개한 이미지입니다.',
    },
    {
      'header': '※ 본 애플리케이션의 이미지 정보가 부족한 경우\n',
      'main': '',
      'footer': '메인 아이콘 이미지로 대체될 수 있습니다.',
    },
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
      'index': 0,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'cash',
      'text': '캐시',
      'index': 1,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'pet/symbol',
      'text': '펫/심볼',
      'index': 2,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
  static final List<dynamic> equipmentSymbolTabList = [
    {
      'name': 'ARC',
      'text': 'ARCANE',
    },
    {
      'name': 'AUT',
      'text': 'AUTHENTIC',
    },
  ];
  static final List<dynamic> detailStatTabList = [
    {
      'name': 'basic',
      'text': '기본',
      'index': 0,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'hexa',
      'text': 'HEXA',
      'index': 1,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'ability/hyper',
      'text': '어빌리티 /\n하이퍼',
      'index': 2,
      'fontSize': FontConfig.commonSize,
      'dimenSize': 0.0,
    },
  ];
  static final List<dynamic> detailSkillTabList = [
    {
      'name': 'hexa',
      'text': 'HEXA',
      'index': 0,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'v',
      'text': 'V',
      'index': 1,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'link',
      'text': '링크',
      'index': 2,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
  static final List<dynamic> detailUnionTabList = [
    {
      'name': 'raider',
      'text': '기본',
      'index': 0,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'artifact',
      'text': '아티팩트',
      'index': 1,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
    {
      'name': 'mainCharacter',
      'text': '본캐추적',
      'index': 2,
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
  static final List<dynamic> unionRadierTabList = [
    {
      'name': 'occupied',
      'text': '공격대 점령 효과',
    },
    {
      'name': 'inner',
      'text': '공격대원 효과',
    },
  ];
  /**-----preset */
  static final List<dynamic> itemPresetTabList = [
    {
      'name': 'main',
      'text': 'M',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset1',
      'text': '1',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset2',
      'text': '2',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset3',
      'text': '3',
      'fontSize': FontConfig.commonSize,
    },
  ];
  static final List<dynamic> cashPresetTabList = [
    {
      'name': 'main',
      'text': 'M',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset1',
      'text': '1',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset2',
      'text': '2',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset3',
      'text': '3',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'android',
      'text': 'A',
      'fontSize': FontConfig.commonSize,
    },
  ];
  static final List<dynamic> abilityPresetTabList = [
    {
      'name': 'preset1',
      'text': '1',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset2',
      'text': '2',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset3',
      'text': '3',
      'fontSize': FontConfig.commonSize,
    },
  ];
  static final List<dynamic> hyperPresetTabList = [
    {
      'name': 'preset1',
      'text': '1',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset2',
      'text': '2',
      'fontSize': FontConfig.commonSize,
    },
    {
      'name': 'preset3',
      'text': '3',
      'fontSize': FontConfig.commonSize,
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
      'name': 'GLOVES',
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
      '스탯 공격력\n',
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
      '공격 속도',
    ],
  ];
  static final List<dynamic> unionArtifactCrystalList = [
    '주황버섯',
    '슬라임',
    '뿔버섯',
    '스텀프',
    '스톤골렘',
    '발록',
    '자쿰',
    '핑크빈',
    '파풀라투스',
  ];
}
