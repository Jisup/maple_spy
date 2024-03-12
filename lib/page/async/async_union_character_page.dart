import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/union_character_page.dart';
import 'package:maplespy/provider/union_character_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncUnionCharacterPage extends ConsumerWidget {
  const AsyncUnionCharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUnionMainCharacter = ref.watch(asyncUnionCharacterProvider);

    return switch (asyncUnionMainCharacter) {
      AsyncData() => UnionCharacterPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.unionPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
