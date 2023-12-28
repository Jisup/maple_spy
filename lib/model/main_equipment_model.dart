import 'package:maple_app/model/equipment/android_item_model.dart';
import 'package:maple_app/model/equipment/beauty_item_model.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/model/equipment/item_set_effect_model.dart';
import 'package:maple_app/model/equipment/pet_item_model.dart';
import 'package:maple_app/model/equipment/symbol_item_model.dart';

class MainEquipment {
  Item? item;
  CashItem? cash;
  BeautyItem? beauty;
  PetItem? pet;
  SymbolItem? symbol;
  AndroidItem? android;
  ItemSetEffect? setEffect;

  MainEquipment({
    this.item,
    this.cash,
    this.beauty,
    this.pet,
    this.symbol,
    this.android,
    this.setEffect,
  });

  MainEquipment copyWith(
          {Item? item,
          CashItem? cash,
          BeautyItem? beauty,
          PetItem? pet,
          SymbolItem? symbol,
          AndroidItem? android,
          ItemSetEffect? setEffect}) =>
      MainEquipment(
          item: item ?? this.item,
          cash: cash ?? this.cash,
          beauty: beauty ?? this.beauty,
          pet: pet ?? this.pet,
          symbol: symbol ?? this.symbol,
          android: android ?? this.android,
          setEffect: setEffect ?? this.setEffect);
}
