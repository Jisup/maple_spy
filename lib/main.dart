import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/provider/stat_notifier.dart';
import 'package:maple_app/util/main_router.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MapleApp()));
}

class MapleApp extends ConsumerWidget {
  const MapleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Maple Charactor Information Application",
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      themeMode: ThemeMode.light,
      routerConfig: mainRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
