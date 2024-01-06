import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/page/equipment/pet_symbol_page.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/equipment_pet_symbol_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncPetSymbolPage extends ConsumerWidget {
  const AsyncPetSymbolPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPetSymbol = ref.watch(asyncEquipmentPetSymbolProvider);

    return switch (asyncPetSymbol) {
      AsyncData(:final value) =>
        PetSymbolPage(pet: value.pet!, symbol: value.symbol!),
      AsyncError(:final error) => MainErrorPage(
          message: 'equipment pet/symbol request\nhas something error'),
      _ => LoadingSpinner(),
    };
  }
}
