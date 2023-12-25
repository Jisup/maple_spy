import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/widget/main_bottom_navigation_bar.dart';

class MainContainer extends ConsumerWidget {
  const MainContainer({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        // appBar: MainAppBar(),
        body: body,
        bottomNavigationBar: const MainBottomNavigationBar(),
      ),
    );
  }
}
