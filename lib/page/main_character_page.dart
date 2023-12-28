import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/page/character/character_detail.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/widget/common/error_page.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';
import 'package:maple_app/container/main_container.dart';

class MainCharacter extends ConsumerWidget {
  const MainCharacter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCharacter = ref.watch(asyncCharacterProvider);
    return MainContainer(
        isHome: false,
        // body: Container(
        //   alignment: Alignment.center,
        //   child: Text('character'),
        // ),
        body: switch (asyncCharacter) {
          AsyncData(:final value) => CharacterDetail(character: value),
          AsyncError(:final error) => ErrorPage(message: error),
          _ => const LoadingSpinner(),
        });
  }
}
