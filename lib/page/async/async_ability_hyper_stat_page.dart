import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/ability_hyper_stat_page.dart';
import 'package:maplespy/provider/stat_ablity_hyper_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncAbilityHyperStatPage extends ConsumerWidget {
  const AsyncAbilityHyperStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAbilityHyperStat = ref.watch(asyncStatAbilityHyperProvider);

    return switch (asyncAbilityHyperStat) {
      AsyncData() => const AbilityHyperStatPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.statPageRequestError),
      _ => const LoadingSpinner(),
    };
  }
}
