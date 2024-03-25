import 'package:flutter/material.dart';
import 'package:maplespy/config/const_config.dart';

AppBar mainAppBar({
  required BuildContext context,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    leading: GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
          padding: EdgeInsets.all(DimenConfig.commonDimen),
          child: const Image(
            image: AssetImage('assets/maplespy_icon.png'),
            semanticLabel: 'MapleSpy 로고',
          )),
    ),
    title: Text(
      'MapleSpy',
      textAlign: TextAlign.center,
      style: TextStyle(color: colorScheme.onPrimary, fontFamily: 'Maplestory'),
    ),
    backgroundColor: colorScheme.primary,
  );
}
