import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/provider/stat_notifier.dart';
import 'package:maple_app/util/main_router.dart';

void main() {
  runApp(const ProviderScope(child: MapleApp()));
}

// class MapleApp extends StatelessWidget {
//   const MapleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: "Maple Charactor Information Application",
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: lightColorScheme,
//       ),
//       themeMode: ThemeMode.light,
//       routerConfig: mainRouter,
//       debugShowCheckedModeBanner: false,
//     );
//   } MapleApp
// MapleApp}

class MapleApp extends ConsumerWidget {
  const MapleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getJsonData(context, ref);

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

void getJsonData(BuildContext context, WidgetRef ref) async {
  String jsonData = await rootBundle.loadString('lib/assets/dummy.json');
  final jsonResponse = jsonDecode(jsonData);

  var _characterNotifier = ref.watch(characterProvider.notifier);
  var _statNotifier = ref.watch(statProvider.notifier);
  var _equipmentNotifier = ref.watch(equipmentListProvider.notifier);

  // jsonResponse['Ocid']; // ocid
  // jsonResponse['Basic']; // Basic
  // jsonResponse['Popularity']; // Popularity
  _characterNotifier.addOcid(jsonResponse['Ocid']);
  _characterNotifier.addBasic(jsonResponse['Basic']);
  _characterNotifier.addPopularity(jsonResponse['Popularity']);

  // jsonResponse['Stat']; // Stat
  _statNotifier.addStat(jsonResponse['Stat']);

  // jsonResponse['Items']; // Items
  _equipmentNotifier.addItems(jsonResponse['Items']);
}
