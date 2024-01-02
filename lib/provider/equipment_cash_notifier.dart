import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/android_item_model.dart';
import 'package:maple_app/model/equipment/beauty_item_model.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/model/main_equipment_cash_model.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/util/day_instance.dart';
import 'package:maple_app/util/dio_instance.dart';

final asyncEquipmentCashProvider =
    AutoDisposeAsyncNotifierProvider<EquipmentCashNotifier, MainEquipmentCash>(
        EquipmentCashNotifier.new);

class EquipmentCashNotifier
    extends AutoDisposeAsyncNotifier<MainEquipmentCash> {
  Future<MainEquipmentCash> _fetchCash() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider.notifier).state;
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**cash item equipment */
    Response cashItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_CASHITEM_PATH'));
    CashItem cashItem = CashItem.fromJson(cashItemResponse.data);
    /**android equipment */
    Response androidItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_ANDROID_PATH'));
    AndroidItem androidItem = AndroidItem.fromJson(androidItemResponse.data);
    /**beauty equipment */
    Response beautyItemResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_BEAUTY_PATH'));
    BeautyItem beautyItem = BeautyItem.fromJson(beautyItemResponse.data);

    return MainEquipmentCash(
      cash: cashItem,
      beauty: beautyItem,
      android: androidItem,
    );
  }

  @override
  Future<MainEquipmentCash> build() {
    return _fetchCash();
  }
}
