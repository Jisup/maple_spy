import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/widget/main_container/main_app_bar.dart';
import 'package:maplespy/widget/main_container/main_bottom_navigation_bar.dart';

class MainContainer extends ConsumerWidget {
  const MainContainer({super.key, required this.isHome, required this.body});

  final bool isHome;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterName = ref.watch(characterNameProvider.notifier).state;
    return SafeArea(
      child: Scaffold(
        appBar: mainAppBar(
            context: context, isHome: isHome, characterName: characterName),
        body: body,
        bottomNavigationBar: isHome ? null : const MainBottomNavigationBar(),
      ),
    );
  }
}
