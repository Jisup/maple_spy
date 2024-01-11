import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/stat_page.dart';
import 'package:maplespy/provider/stat_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncStatPage extends ConsumerWidget {
  const AsyncStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStat = ref.watch(asyncStatProvider);

    return switch (asyncStat) {
      AsyncData(:final value) => StatPage(mainStat: value),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.statPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
