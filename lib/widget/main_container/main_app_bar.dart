import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';

AppBar mainAppBar({
  required BuildContext context,
  required bool isHome,
  required String characterName,
  required String characterWorld,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    leading: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: isHome ? null : () => context.pop(),
      child: Container(
        padding: isHome ? EdgeInsets.all(DimenConfig.commonDimen) : null,
        child: isHome
            ? Image(
                image: AssetImage('assets/maplespy_icon.png'),
                semanticLabel: 'MapleSpy 로고',
              )
            : Icon(
                Icons.navigate_before_rounded,
                color: Colors.white,
                semanticLabel: '뒤로 가기 버튼',
              ),
      ),
    ),
    title: Text(
      isHome ? 'MapleSpy' : '${characterName} (${characterWorld})',
      textAlign: TextAlign.center,
      style: TextStyle(color: colorScheme.onPrimary, fontFamily: 'Maplestory'),
    ),
    backgroundColor: colorScheme.primary,
  );
}
