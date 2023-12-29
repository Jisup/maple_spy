import 'package:flutter/material.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/provider/equipment_notifier.dart';

class StaticConfig {
  static final List mainBottomNavigationTab = [
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
  static final List detailEquipmentTab = [
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
  static final List detailStatTab = [
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
      'fontSize': FontConfig.commonSize,
      'dimenSize': 0.0,
    },
  ];
  static final List detailSkillTab = [
    {
      'name': 'HEXAmatrix',
      'text': 'HEXA\n매트릭스',
      'fontSize': FontConfig.commonSize,
      'dimenSize': 0.0,
    },
    {
      'name': 'Vmatrix',
      'text': 'V\n매트릭스',
      'fontSize': FontConfig.commonSize,
      'dimenSize': 0.0,
    },
    {
      'name': 'link',
      'text': '링크 스킬',
      'fontSize': FontConfig.commonSize,
      'dimenSize': DimenConfig.commonDimen,
    },
  ];
}
