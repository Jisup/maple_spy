import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/const_config.dart';

AppBar MainAppBar(BuildContext context, bool isHome) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return isHome
      ? AppBar(
          leading: GestureDetector(
              onTap: () => context.go("/"),
              child: Container(
                padding: EdgeInsets.all(DimenConfig.commonDimen),
                child: const Image(
                  image: AssetImage('lib/assets/maple_icon.png'),
                ),
              )),
          title: Text(
            'Maple',
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onPrimary),
          ),
          backgroundColor: colorScheme.primary,
        )
      : AppBar(
          leading: GestureDetector(
              onTap: () => context.go("/"),
              child: Container(
                padding: EdgeInsets.all(DimenConfig.commonDimen),
                child: const Image(
                  image: AssetImage('lib/assets/maple_icon.png'),
                ),
              )),
          title: Text(
            'User NickName',
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onPrimary),
          ),
          backgroundColor: colorScheme.primary,
        );
}
