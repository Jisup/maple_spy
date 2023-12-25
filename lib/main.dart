import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/util/main_router.dart';

void main() {
  runApp(const ProviderScope(child: MapleApp()));
}

class MapleApp extends StatelessWidget {
  const MapleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Maple Charactor Information Application",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      themeMode: ThemeMode.light,
      routerConfig: mainRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
