import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/union_raider_page.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncUnionRaiderPage extends ConsumerWidget {
  const AsyncUnionRaiderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUnionRaider = ref.watch(asyncUnionRaiderProvider);

    return switch (asyncUnionRaider) {
      AsyncData() => UnionRaiderPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.unionPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
