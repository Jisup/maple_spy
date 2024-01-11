import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/model/equipment/beauty_item_model.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';
import 'package:maplespy/model/main_equipment_cash_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncEquipmentCashProvider =
    AutoDisposeAsyncNotifierProvider<EquipmentCashNotifier, MainEquipmentCash>(
        EquipmentCashNotifier.new);

class EquipmentCashNotifier
    extends AutoDisposeAsyncNotifier<MainEquipmentCash> {
  Future<MainEquipmentCash> _fetchCash() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**cash item equipment */
    Response cashItemResponse;
    CashItem cashItem;
    try {
      cashItemResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_CASHITEM_PATH'));
      cashItem = CashItem.fromJson(cashItemResponse.data);
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
    /**beauty equipment */
    Response beautyItemResponse;
    BeautyItem beautyItem;
    try {
      beautyItemResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_BEAUTY_PATH'));
      beautyItem = BeautyItem.fromJson(beautyItemResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

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
