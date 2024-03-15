import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar subAppBar({
  required BuildContext context,
  required String characterName,
  required String characterWorld,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    leading: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.go('/'),
      child: Container(
        child: Icon(
          Icons.navigate_before_rounded,
          color: Colors.white,
          semanticLabel: '뒤로 가기 버튼',
        ),
      ),
    ),
    title: Text(
      '${characterName} (${characterWorld})',
      textAlign: TextAlign.center,
      style: TextStyle(color: colorScheme.onPrimary, fontFamily: 'Maplestory'),
    ),
    backgroundColor: colorScheme.primary,
  );
}
