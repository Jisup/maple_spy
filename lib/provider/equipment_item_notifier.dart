import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/model/equipment/item_set_effect_model.dart';
import 'package:maplespy/model/main_equipment_item_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncEquipmentItemProvider =
    AsyncNotifierProvider<EquipmentItemNotifier, MainEquipmentItem>(
        EquipmentItemNotifier.new);

class EquipmentItemNotifier extends AsyncNotifier<MainEquipmentItem> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  Future<MainEquipmentItem> _fetchItem() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**item equipment */
    Response itemResponse;
    Item item;
    try {
      itemResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_ITEM_PATH'));
      item = Item.fromJson(itemResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    /**android equipment */
    Response androidItemResponse;
    AndroidItem androidItem;
    try {
      androidItemResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_ANDROID_PATH'));
      androidItem = AndroidItem.fromJson(androidItemResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    /**set effect equipment */
    Response itemSetEffectResponse;
    ItemSetEffect itemSetEffect;
    try {
      itemSetEffectResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_SETEFFECT_PATH'));
      itemSetEffect = ItemSetEffect.fromJson(itemSetEffectResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    return MainEquipmentItem(
      item: item,
      androidItem: androidItem,
      setEffect: itemSetEffect,
    );
  }

  @override
  Future<MainEquipmentItem> build() {
    return _fetchItem();
  }

  Future<void> getNewItemEquipment() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchItem());
  }
}
