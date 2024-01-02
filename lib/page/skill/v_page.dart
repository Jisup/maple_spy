import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/model/skill/vmatrix_skill_model.dart';

class VPage extends ConsumerWidget {
  const VPage({super.key, required this.vSkill, required this.vmatrix});

  final Skill? vSkill;
  final VmatrixSkill? vmatrix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('v');
  }
}
