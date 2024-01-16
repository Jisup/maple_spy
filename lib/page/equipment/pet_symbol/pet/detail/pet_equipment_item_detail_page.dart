import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';

class PetEquipmentItemDetailPage extends ConsumerWidget {
  const PetEquipmentItemDetailPage({
    super.key,
    required this.item,
  });

  final PetEquipment item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
