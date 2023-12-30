import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/item_model.dart';

class ItemDetail extends ConsumerWidget {
  const ItemDetail({super.key, required this.item});

  final ItemEquipment item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(item.toJson());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('item detail')),
      ),
    );
  }
}
