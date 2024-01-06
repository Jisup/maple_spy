import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/model/equipment/item_set_effect_model.dart';
import 'package:maplespy/model/main_equipment_item_model.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncEquipmentItemProvider =
    AutoDisposeAsyncNotifierProvider<EquipmentItemNotifier, MainEquipmentItem>(
        EquipmentItemNotifier.new);

class EquipmentItemNotifier
    extends AutoDisposeAsyncNotifier<MainEquipmentItem> {
  Future<MainEquipmentItem> _fetchItem() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**item equipment */
    Response itemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_ITEM_PATH'));
    Item item = Item.fromJson(itemResponse.data);
    /**set effect equipment */
    Response itemSetEffectResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_SETEFFECT_PATH'));
    ItemSetEffect itemSetEffect =
        ItemSetEffect.fromJson(itemSetEffectResponse.data);

    return MainEquipmentItem(
      item: item,
      setEffect: itemSetEffect,
    );
  }

  @override
  Future<MainEquipmentItem> build() {
    return _fetchItem();
  }
}
