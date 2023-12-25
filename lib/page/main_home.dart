import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/widget/main_container.dart';

class MainHome extends ConsumerWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      isHome: true,
      body: Container(
        alignment: Alignment.center,
        child: Text('home'),
      ),
    );
  }
}
