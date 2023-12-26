// import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/android_item_model.dart';
import 'package:maple_app/model/equipment/beauty_item_model.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/model/equipment/item_set_effect_model.dart';
import 'package:maple_app/model/equipment/pet_item_model.dart';
import 'package:maple_app/model/equipment/symbol_item_model.dart';
import 'package:maple_app/model/main_equipment_model.dart';

// final equipmentProvider = AutoDisposeAsyncNotifierProvider<
//     EquipmentNotifier, MainEquipment>(EquipmentListNotifier.new);

// class EquipmentNotifier
//     extends AutoDisposeAsyncNotifier<MainEquipment> {
//   @override
//   FutureOr<MainEquipment> build() {
//     return
//       // MainEquipment(
//       //   item: Item(),
//       //   cash: CashItem(),
//       //   beauty: BeautyItem(),
//       //   pet: PetItem(),
//       //   symbol: SymbolItem(),
//       //   android: AndroidItem(),
//       //   setEffect: ItemSetEffect(),
//       // );
//
//   }
// }

final equipmentListProvider =
    NotifierProvider<EquipmentNotifier, MainEquipment>(EquipmentNotifier.new);

class EquipmentNotifier extends Notifier<MainEquipment> {
  @override
  MainEquipment build() {
    return MainEquipment(
      item: Item(),
      cash: CashItem(),
      beauty: BeautyItem(),
      pet: PetItem(),
      symbol: SymbolItem(),
      android: AndroidItem(),
      setEffect: ItemSetEffect(),
    );
  }

  void addItems(final itemsData) {
    print(state.item.itemEquipment?.length);
    state = state.copyWith(item: Item.fromJson(itemsData));
    print(state.item.itemEquipment?.length);
  }
}
