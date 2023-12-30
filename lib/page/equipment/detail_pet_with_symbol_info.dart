import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/pet_item_model.dart';
import 'package:maple_app/model/equipment/symbol_item_model.dart';

class DetailPetWithSymbolInfo extends ConsumerWidget {
  const DetailPetWithSymbolInfo({super.key, required this.pet, required this.symbol});

  final PetItem pet;
  final SymbolItem symbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text('pet/symbol'),
    );
  }
}
