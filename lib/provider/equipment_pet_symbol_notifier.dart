import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/model/equipment/symbol_item_model.dart';
import 'package:maplespy/model/main_equipment_pet_symbol_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncEquipmentPetSymbolProvider = AutoDisposeAsyncNotifierProvider<
    EquipmentPetSymbolNotifier,
    MainEquipmentPetSymbol>(EquipmentPetSymbolNotifier.new);

class EquipmentPetSymbolNotifier
    extends AutoDisposeAsyncNotifier<MainEquipmentPetSymbol> {
  Future<MainEquipmentPetSymbol> _fetchPetSymbol() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**pet equipment */
    Response petItemResponse;
    PetItem petItem;
    try {
      petItemResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_PET_PATH'));
      petItem = PetItem.fromJson(petItemResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    /**symbol equipment */
    Response symbolItemResponse;
    SymbolItem symbolItem;
    try {
      symbolItemResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_SYMBOL_PATH'));
      symbolItem = SymbolItem.fromJson(symbolItemResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    return MainEquipmentPetSymbol(pet: petItem, symbol: symbolItem);
  }

  @override
  Future<MainEquipmentPetSymbol> build() {
    return _fetchPetSymbol();
  }
}
