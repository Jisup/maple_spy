import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/model/equipment/beauty_item_model.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';

class MainEquipmentCash {
  CashItem? cash;
  BeautyItem? beauty;
  AndroidItem? android;

  MainEquipmentCash({
    this.cash,
    this.beauty,
    this.android,
  });
}
