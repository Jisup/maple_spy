import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/model/equipment/pet/pet_detail_model.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/page/equipment/cash/detail/cash_detail_page.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/detail/pet_detail_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/detail/pet_equipment_item_detail_page.dart';
import 'package:maplespy/page/main_character_page.dart';
import 'package:maplespy/page/main_equipment_page.dart';
import 'package:maplespy/page/main_home_page.dart';
import 'package:maplespy/page/main_information_page.dart';
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
      routes: [
        GoRoute(
          path: 'information',
          name: 'homeInformation',
          pageBuilder: (context, state) => NoTransitionPage(
            child: MainInforMationPage(),
          ),
        ),
        GoRoute(
          path: 'character',
          name: 'character',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MainCharacterPage()),
        ),
        GoRoute(
            path: 'equipment',
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
              GoRoute(
                path: 'cash/detail',
                name: 'cashDetail',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: CashDetailPage(
                      cashItem: state.extra as CashItemEquipment),
                ),
              ),
              GoRoute(
                path: 'pet/detail',
                name: 'petDetail',
                pageBuilder: (context, state) => NoTransitionPage(
                    child: PetDetailPage(pet: state.extra as Pet)),
              ),
              GoRoute(
                  path: 'pet/equipment/item/detail',
                  name: 'petEquilmentItemDetail',
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: PetEquipmentItemDetailPage(
                            equipment: (state.extra as Pet).petEquipment
                                as PetEquipment,
                            petType: (state.extra as Pet).petPetType),
                      ))
            ]),
        GoRoute(
          path: 'stat',
          name: 'stat',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MainStatPage()),
        ),
        GoRoute(
          path: 'skill',
          name: 'skill',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MainSkillPage()),
        ),
      ],
    ),
  ],
);
