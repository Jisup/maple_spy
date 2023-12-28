import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/container/main_container.dart';
import 'package:maple_app/model/main_equipment_model.dart';
import 'package:maple_app/page/equipment/equipment_detail.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/widget/common/error_page.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';

class MainEquipmentPage extends ConsumerWidget {
  const MainEquipmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EquipmentDetail(equipment: MainEquipment());
    // final asyncEquipment = ref.watch(asyncEquipmentProvider);

    // return MainContainer(
    //   isHome: false,
    //   body: switch (asyncEquipment) {
    //     AsyncData(:final value) => EquipmentDetail(equipment: value),
    //     AsyncError(:final error) => ErrorPage(message: error),
    //     _ => const LoadingSpinner(),
    //   },
    // );
  }
}
