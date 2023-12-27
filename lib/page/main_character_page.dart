import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/widget/common/error_page.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';
import 'package:maple_app/widget/main/main_container.dart';

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
          AsyncData(:final value) => Container(
              alignment: Alignment.center,
              child: Text('character: ${value.basic?.characterName}'),
            ),
          AsyncError(:final error) => ErrorPage(message: error),
          _ => const LoadingSpinner(),
        });
  }
}
