import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/skill/vmatrix_skill_model.dart';

class VMatrixPage extends ConsumerWidget {
  const VMatrixPage({super.key, required this.vmatrix});

  final VmatrixSkill? vmatrix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('v');
  }
}
