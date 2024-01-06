import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/static_list_config.dart';

class MainBottomNavigationBar extends ConsumerWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorScheme = Theme.of(context).colorScheme;
    return BottomAppBar(
      padding: EdgeInsets.zero,
      elevation: 0, // z-index
      color: colorScheme.background,
      child: Row(
        children: StaticListConfig.mainBottomNavigationTabList.map(
          (tab) {
            var equal = GoRouterState.of(context).name == tab['name'];
            return GestureDetector(
              onTap: equal ? null : () => context.go(tab['path']),
              child: Container(
                width: MediaQuery.of(context).size.width /
                    StaticListConfig.mainBottomNavigationTabList.length,
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
                          fontFamily: 'Maplestory',
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
