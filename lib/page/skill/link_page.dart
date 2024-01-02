import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/skill/link_skill_model.dart';

class LinkPage extends ConsumerWidget {
  const LinkPage({super.key, required this.link});

  final LinkSkill? link;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('link');
  }
}
