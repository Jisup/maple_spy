import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/basic_stat_page.dart';
import 'package:maplespy/provider/stat_basic_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncBasicStatPage extends ConsumerWidget {
  const AsyncBasicStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBasicStat = ref.watch(asyncStatBasicProvider);

    return switch (asyncBasicStat) {
      AsyncData() => BasicStatPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.statPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
