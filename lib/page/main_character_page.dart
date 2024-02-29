import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/page/async/async_character_page.dart';
import 'package:maplespy/container/main_container.dart';
import 'package:maplespy/provider/character_notifier.dart';

class MainCharacterPage extends ConsumerWidget {
  const MainCharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      isHome: false,
      body: AsyncCharacterPage(),
    );
  }
}
