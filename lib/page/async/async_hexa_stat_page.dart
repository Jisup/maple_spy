import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/hexa_stat_page.dart';
import 'package:maplespy/provider/stat_hexa_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncHexaStatPage extends ConsumerWidget {
  const AsyncHexaStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHexaStat = ref.watch(asyncStatHexaProvider);

    return switch (asyncHexaStat) {
      AsyncData() => HexaStatPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.statPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
