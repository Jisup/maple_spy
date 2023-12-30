import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/const_config.dart';

AppBar MainAppBar(BuildContext context, bool isHome, String characterName) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    leading: GestureDetector(
      onTap: () => context.go("/"),
      child: Container(
        padding: isHome ? EdgeInsets.all(DimenConfig.commonDimen) : null,
        child: isHome
            ? Image(
                image: AssetImage('assets/maple_icon.png'),
              )
            : Icon(
                Icons.navigate_before_rounded,
                color: Colors.white,
              ),
      ),
    ),
    title: Text(
      isHome ? 'Maple' : characterName,
      textAlign: TextAlign.center,
      style: TextStyle(color: colorScheme.onPrimary, fontFamily: 'Maplestory'),
    ),
    backgroundColor: colorScheme.primary,
  );
}
