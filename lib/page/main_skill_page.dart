import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/widget/main/main_container.dart';

class MainSkill extends ConsumerWidget {
  const MainSkill({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      isHome: false,
      body: Container(
        alignment: Alignment.center,
        child: Text('skill'),
      ),
    );
  }
}
