import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/provider/equipment_notifier.dart';

class DetailSelectTabWidget extends ConsumerWidget {
  const DetailSelectTabWidget(
      {super.key, required this.tabList, required this.provider});

  final List tabList;
  final StateProvider<String> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.all(DimenConfig.commonDimen),
      child: Row(
        children: tabList.map(
          (tab) {
            var equal = ref.watch(provider) == tab['name'];
            return Expanded(
              child: GestureDetector(
                onTap: () => equal
                    ? null
                    : ref
                        .watch(provider.notifier)
                        .update((state) => tab['name']),
                child: Container(
                  margin: EdgeInsets.all(DimenConfig.commonDimen),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        equal ? colorScheme.primary : colorScheme.onSecondary,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(RadiusConfig.commonRadius),
                      right: Radius.circular(RadiusConfig.commonRadius),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(tab['dimenSize']),
                    child: Text(
                      tab['text'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: tab['fontSize'],
                          fontWeight: FontWeight.bold,
                          letterSpacing: SpacingConfig.commonSpacing),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
