import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/page/equipment/item_page.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/provider/equipment_item_notifier.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';

class AsyncItemPage extends ConsumerWidget {
  const AsyncItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItem = ref.watch(asyncEquipmentItemProvider);

    return switch (asyncItem) {
      AsyncData(:final value) => ItemPage(item: value.item),
      AsyncError(:final error) =>
        MainErrorPage(message: 'equipment item request\nhas somthing Error'),
      _ => LoadingSpinner()
    };
  }
}
