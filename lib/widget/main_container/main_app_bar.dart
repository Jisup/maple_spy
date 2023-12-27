import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/const_config.dart';

AppBar MainAppBar(BuildContext context, bool isHome, String characterName) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    leading: GestureDetector(
      onTap: () => context.go("/"),
      child: Container(
        padding: EdgeInsets.all(DimenConfig.commonDimen),
        child: isHome
            ? Image(
                image: AssetImage('lib/assets/maple_icon.png'),
              )
            : Icon(Icons.navigate_before_rounded),
      ),
    ),
    title: Text(
      isHome ? 'Maple' : characterName,
      textAlign: TextAlign.center,
      style: TextStyle(color: colorScheme.onPrimary),
    ),
    backgroundColor: colorScheme.primary,
  );
}
