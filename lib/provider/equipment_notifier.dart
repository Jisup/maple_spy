import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/android_item_model.dart';
import 'package:maple_app/model/equipment/beauty_item_model.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/model/equipment/item_set_effect_model.dart';
import 'package:maple_app/model/equipment/pet_item_model.dart';
import 'package:maple_app/model/equipment/symbol_item_model.dart';
import 'package:maple_app/model/main_equipment_model.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/util/day_instance.dart';
import 'package:maple_app/util/dio_instance.dart';

final asyncEquipmentProvider =
    AutoDisposeAsyncNotifierProvider<EquipmentNotifier, MainEquipment>(
        EquipmentNotifier.new);

final equipmentSelectTabProvider = StateProvider((_) => 'item');

class EquipmentNotifier extends AutoDisposeAsyncNotifier<MainEquipment> {
  Future<MainEquipment> _fetchEquipment() async {
    final dioInstance = DioInstance();

    final ocid = ref.watch(ocidProvider.notifier).state;
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**item equipment */
    Response itemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_ITEM_PATH'));
    Item item = Item.fromJson(itemResponse.data);
    /**cash item equipment */
    Response cashItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_CASHITEM_PATH'));
    CashItem cashItem = CashItem.fromJson(cashItemResponse.data);
    /**beauty equipment */
    Response beautyItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_BEAUTY_PATH'));
    BeautyItem beautyItem = BeautyItem.fromJson(beautyItemResponse.data);
    /**pet equipment */
    Response petItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_PET_PATH'));
    PetItem petItem = PetItem.fromJson(petItemResponse.data);
    /**symbol equipment */
    Response symbolItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_SYMBOL_PATH'));
    SymbolItem symbolItem = SymbolItem.fromJson(symbolItemResponse.data);
    /**android equipment */
    Response androidItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_ANDROID_PATH'));
    AndroidItem androidItem = AndroidItem.fromJson(androidItemResponse.data);
    /**set effect equipment */
    Response itemSetEffectResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_SETEFFECT_PATH'));
    ItemSetEffect itemSetEffect =
        ItemSetEffect.fromJson(itemSetEffectResponse.data);

    return MainEquipment(
        item: item,
        cash: cashItem,
        beauty: beautyItem,
        pet: petItem,
        symbol: symbolItem,
        android: androidItem,
        setEffect: itemSetEffect);
  }

  @override
  FutureOr<MainEquipment> build() {
    return _fetchEquipment();
  }
}
