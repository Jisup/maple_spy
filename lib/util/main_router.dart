import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/model/equipment/pet/pet_detail_model.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/model/firestore/notice.dart';
import 'package:maplespy/model/skill/skill_info_model.dart';
import 'package:maplespy/page/equipment/item/detail/android_item_detail_page.dart';
import 'package:maplespy/page/main_notice_page.dart';
import 'package:maplespy/page/main_union_page.dart';
import 'package:maplespy/page/equipment/cash/detail/cash_detail_page.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/detail/pet_detail_page.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/detail/pet_equipment_item_detail_page.dart';
import 'package:maplespy/page/main_character_page.dart';
import 'package:maplespy/page/main_equipment_page.dart';
import 'package:maplespy/page/main_home_page.dart';
import 'package:maplespy/page/main_information_page.dart';
import 'package:maplespy/page/main_insert_page.dart';
import 'package:maplespy/page/main_skill_page.dart';
import 'package:maplespy/page/main_stat_page.dart';
import 'package:maplespy/page/main_update_page.dart';
import 'package:maplespy/page/skill/detail/skill_detail_page.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

GoRouter mainRouter = GoRouter(
  navigatorKey: navigatorkey,
  initialLocation: '/insert',
  routes: [
    GoRoute(
      path: '/insert',
      name: 'insert',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: MainInsertPage()),
    ),
    GoRoute(
      path: '/update',
      name: 'update',
      pageBuilder: (context, state) => NoTransitionPage(
          child: MainUpdatePage(
              oldVersion: (state.extra as dynamic)['oldVersion'],
              newVersion: (state.extra as dynamic)['newVersion'])),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainHomePage()),
      routes: [
        GoRoute(
          path: 'notice',
          name: 'notice',
          pageBuilder: (context, state) => NoTransitionPage(
              child: MainNoticePage(
            notice: state.extra as Notice,
          )),
        ),
        GoRoute(
          path: 'information',
          name: 'information',
          pageBuilder: (context, state) => NoTransitionPage(
            child: MainInforMationPage(),
          ),
        ),
        GoRoute(
          path: 'character',
          name: 'character',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MainCharacterPage()),
          routes: [
            GoRoute(
              path: 'union',
              name: 'union',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: MainUnionPage()),
            )
          ],
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
                path: 'androidItem/detail',
                name: 'androidItem',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AndroidItemDetailPage(
                      androidItem: state.extra as AndroidItem),
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
            routes: [
              GoRoute(
                path: 'detail',
                name: 'skillDetail',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: SkillDetailPage(skillInfo: state.extra as SkillInfo),
                ),
              ),
            ]),
      ],
    ),
  ],
);
