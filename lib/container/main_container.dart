import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/main_container/main_bottom_navigation_bar.dart';
import 'package:maplespy/widget/main_container/skill_floating_action_button.dart';
import 'package:maplespy/widget/main_container/sub_app_bar.dart';

class MainContainer extends ConsumerWidget {
  const MainContainer({super.key, required this.isHome, required this.body});

  final bool isHome;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterName = ref.watch(characterNameProvider);
    final characterWorld = ref.watch(characterWorldProvider);

    return SafeArea(
      child: Scaffold(
        appBar: subAppBar(
          context: context,
          characterName: characterName,
          characterWorld: characterWorld,
        ),
        body: body,
        bottomNavigationBar: isHome ? null : const MainBottomNavigationBar(),
        floatingActionButton: GoRouterState.of(context).name == 'skill'
            ? SkillFloatingActionButton()
            : null,
      ),
    );
  }
}
