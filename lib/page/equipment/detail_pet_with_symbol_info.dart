import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentDetailPetWithSymbol extends ConsumerWidget {
  const EquipmentDetailPetWithSymbol({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text('pet/symbol'),
    );
  }
}
