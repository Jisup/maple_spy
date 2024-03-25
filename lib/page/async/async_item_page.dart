import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/equipment/item_page.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/equipment_item_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncItemPage extends ConsumerWidget {
  const AsyncItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItem = ref.watch(asyncEquipmentItemProvider);

    return switch (asyncItem) {
      AsyncData(:final value) =>
        ItemPage(item: value.item, androidItem: value.androidItem),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.itemPageRequestError),
      _ => const LoadingSpinner()
    };
  }
}
