import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/widget/main_container.dart';

class MainCharacter extends ConsumerWidget {
  const MainCharacter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      body: Container(
        alignment: Alignment.center,
        child: Text('character'),
      ),
    );
  }
}
