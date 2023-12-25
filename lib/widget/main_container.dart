import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/widget/main_app_bar.dart';
import 'package:maple_app/widget/main_bottom_navigation_bar.dart';

class MainContainer extends ConsumerWidget {
  const MainContainer({super.key, required this.isHome, required this.body});

  final bool isHome;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(context, isHome),
        body: body,
        bottomNavigationBar: isHome ? null : const MainBottomNavigationBar(),
      ),
    );
  }
}
