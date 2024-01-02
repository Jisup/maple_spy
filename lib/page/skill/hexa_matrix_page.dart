import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/skill/hexamatrix_skill_model.dart';

class HexaMatrixPage extends ConsumerWidget {
  const HexaMatrixPage({super.key, required this.hexamatrix});

  final HexamatrixSkill? hexamatrix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('hexa');
  }
}
