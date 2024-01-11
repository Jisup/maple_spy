import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/character/character_info.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncCharacterPage extends ConsumerWidget {
  const AsyncCharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCharacter = ref.watch(asyncCharacterProvider);

    return switch (asyncCharacter) {
      AsyncData(:final value) => CharacterInfo(character: value),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.characterPageRequestError),
      _ => const LoadingSpinner(),
    };
  }
}
