import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/model/equipment/symbol_item_model.dart';
import 'package:maplespy/model/main_equipment_pet_symbol_model.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncEquipmentPetSymbolProvider = AutoDisposeAsyncNotifierProvider<
    EquipmentPetSymbolNotifier,
    MainEquipmentPetSymbol>(EquipmentPetSymbolNotifier.new);

final equipmentSelectSymbolTabProvider = StateProvider((_) => 'ARC');

class EquipmentPetSymbolNotifier
    extends AutoDisposeAsyncNotifier<MainEquipmentPetSymbol> {
  Future<MainEquipmentPetSymbol> _fetchPetSymbol() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**pet equipment */
    Response petItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_PET_PATH'));
    PetItem petItem = PetItem.fromJson(petItemResponse.data);
    /**symbol equipment */
    Response symbolItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_SYMBOL_PATH'));
    SymbolItem symbolItem = SymbolItem.fromJson(symbolItemResponse.data);

    return MainEquipmentPetSymbol(pet: petItem, symbol: symbolItem);
  }

  @override
  Future<MainEquipmentPetSymbol> build() {
    return _fetchPetSymbol();
  }
}
