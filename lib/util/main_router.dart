import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/page/equipment/item/item_detail.dart';
import 'package:maple_app/page/main_character_page.dart';
import 'package:maple_app/page/main_equipment_page.dart';
import 'package:maple_app/page/main_home_page.dart';
import 'package:maple_app/page/main_skill_page.dart';
import 'package:maple_app/page/main_stat_page.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

GoRouter mainRouter = GoRouter(
  navigatorKey: navigatorkey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const NoTransitionPage(child: MainHomePage()),
    ),
    GoRoute(
      path: '/character',
      name: 'character',
      pageBuilder: (context, state) => const NoTransitionPage(child: MainCharacterPage()),
    ),
    GoRoute(path: '/equipment', name: 'equipment', pageBuilder: (context, state) => const NoTransitionPage(child: MainEquipmentPage()), routes: [
      GoRoute(
        path: 'item/detail',
        name: 'itemDetail',
        pageBuilder: (context, state) => NoTransitionPage(
          child: ItemDetail(item: state.extra as ItemEquipment),
        ),
      ),
    ]),
    GoRoute(
      path: '/stat',
      name: 'stat',
      pageBuilder: (context, state) => const NoTransitionPage(child: MainStatPage()),
    ),
    GoRoute(
      path: '/skill',
      name: 'skill',
      pageBuilder: (context, state) => const NoTransitionPage(child: MainSkillPage()),
    ),
  ],
);
