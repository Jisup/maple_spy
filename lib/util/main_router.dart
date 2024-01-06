import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_page.dart';
import 'package:maplespy/page/main_character_page.dart';
import 'package:maplespy/page/main_equipment_page.dart';
import 'package:maplespy/page/main_home_page.dart';
import 'package:maplespy/page/main_skill_page.dart';
import 'package:maplespy/page/main_stat_page.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

GoRouter mainRouter = GoRouter(
  navigatorKey: navigatorkey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainHomePage()),
    ),
    GoRoute(
      path: '/character',
      name: 'character',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainCharacterPage()),
    ),
    GoRoute(
        path: '/equipment',
        name: 'equipment',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: MainEquipmentPage()),
        routes: [
          GoRoute(
            path: 'item/detail',
            name: 'itemDetail',
            pageBuilder: (context, state) => NoTransitionPage(
              child: ItemDetailPage(item: state.extra as ItemEquipment),
            ),
          ),
        ]),
    GoRoute(
      path: '/stat',
      name: 'stat',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainStatPage()),
    ),
    GoRoute(
      path: '/skill',
      name: 'skill',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainSkillPage()),
    ),
  ],
);
