import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class DetailSelectSubTab extends ConsumerWidget {
  const DetailSelectSubTab(
      {super.key, required this.tabList, required this.provider});

  final List tabList;
  final StateProvider<String> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.subDimen,
      ),
      child: Row(
        children: tabList.map(
          (tab) {
            var equal = ref.watch(provider) == tab['name'];
            return Expanded(
              child: GestureDetector(
                onTap: () => equal
                    ? null
                    : ref
                        .read(provider.notifier)
                        .update((state) => tab['name']),
                child: Semantics(
                  label: '${tab['text']} 선택 탭',
                  button: true,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: DimenConfig.commonDimen,
                        right: DimenConfig.commonDimen),
                    decoration: BoxDecoration(
                      color:
                          equal ? colorScheme.primary : colorScheme.onSecondary,
                      borderRadius:
                          BorderRadius.circular(RadiusConfig.subRadius),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(DimenConfig.subDimen),
                    child: CustomTextWidget(
                      text: tab['text'],
                      size: FontConfig.subSize,
                      color: equal ? Colors.white : colorScheme.primary,
                      subColor: equal ? Colors.black26 : Colors.white24,
                      shadowSize: 2,
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
