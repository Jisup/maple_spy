import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/page/async/async_character_page.dart';
import 'package:maplespy/container/main_container.dart';

class MainCharacterPage extends ConsumerWidget {
  const MainCharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print("메인 캐릭터 페이지 접근");
    return const MainContainer(
      isHome: false,
      body: AsyncCharacterPage(),
    );
  }
}
