import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/model/equipment/item_set_effect_model.dart';

class MainEquipmentItem {
  Item? item;
  AndroidItem? androidItem;
  ItemSetEffect? setEffect;

  MainEquipmentItem({
    this.item,
    this.androidItem,
    this.setEffect,
  });
}
