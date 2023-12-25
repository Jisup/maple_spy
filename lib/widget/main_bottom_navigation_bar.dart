import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/static_config.dart';

class MainBottomNavigationBar extends ConsumerWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = Theme.of(context).colorScheme;
    return BottomAppBar(
      padding: EdgeInsets.zero,
      elevation: 0, // z-index
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: StaticConfig.mainBottomNavigationTab.map(
          (tab) {
            var equal = GoRouterState.of(context).name == tab['name'];
            return GestureDetector(
              onTap: equal ? null : () => context.go(tab['path']),
              child: Container(
                width: MediaQuery.of(context).size.width /
                    StaticConfig.mainBottomNavigationTab.length,
                color: equal ? colorScheme.primary : colorScheme.onPrimary,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(tab['icon'],
                        color: equal
                            ? colorScheme.onPrimary
                            : colorScheme.primary),
                    Text(
                      tab['text'],
                      style: TextStyle(
                          color: equal
                              ? colorScheme.onPrimary
                              : colorScheme.primary),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
