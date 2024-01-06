import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/page/equipment/cash_page.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/equipment_cash_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncCashPage extends ConsumerWidget {
  const AsyncCashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCash = ref.watch(asyncEquipmentCashProvider);

    return switch (asyncCash) {
      AsyncData(:final value) => CashPage(
          cash: value.cash,
          beauty: value.beauty,
          android: value.android,
        ),
      AsyncError(:final error) =>
        MainErrorPage(message: 'equipment item request\nhas somthing Error'),
      _ => LoadingSpinner()
    };
  }
}
