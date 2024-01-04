import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/page/stat/stat_page.dart';
import 'package:maple_app/provider/stat_notifier.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';

class AsyncStatPage extends ConsumerWidget {
  const AsyncStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStat = ref.watch(asyncStatProvider);
    return switch (asyncStat) {
      AsyncData(:final value) => StatPage(mainStat: value),
      AsyncError(:final error) =>
        MainErrorPage(message: 'stat request\nhas something error'),
      _ => LoadingSpinner(),
    };
  }
}