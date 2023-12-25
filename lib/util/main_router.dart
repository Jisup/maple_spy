import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/page/main_character.dart';
import 'package:maple_app/page/main_equipment.dart';
import 'package:maple_app/page/main_home.dart';
import 'package:maple_app/page/main_skill.dart';
import 'package:maple_app/page/main_stat.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

GoRouter mainRouter = GoRouter(
  navigatorKey: navigatorkey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainHome()),
    ),
    GoRoute(
      path: '/character',
      name: 'character',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainCharacter()),
    ),
    GoRoute(
      path: '/equipment',
      name: 'equipment',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainEquipment()),
    ),
    GoRoute(
      path: '/stat',
      name: 'stat',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainStat()),
    ),
    GoRoute(
      path: '/skill',
      name: 'skill',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainSkill()),
    ),
  ],
);
