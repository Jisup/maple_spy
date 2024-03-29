import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';

class DetailSelectTabWidget extends ConsumerWidget {
  const DetailSelectTabWidget({
    super.key,
    required this.tabList,
    required this.provider,
    this.scrollController,
    this.pageController,
  });

  final List tabList;
  final StateProvider<String> provider;
  final ScrollController? scrollController;
  final PageController? pageController;

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
                onTap: equal
                    ? null
                    : () {
                        ref
                            .read(provider.notifier)
                            .update((state) => tab['name']);
                        if (pageController != null &&
                            pageController!.hasClients) {
                          pageController!.jumpToPage(tab['index']);
                        }
                        if (scrollController != null &&
                            scrollController!.hasClients) {
                          scrollController?.jumpTo(0);
                        }
                      },
                child: Semantics(
                  label: '${tab['text']} 선택 탭',
                  button: true,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: equal ? Colors.white : colorScheme.primary,
                            fontSize: tab['fontSize'],
                            fontWeight: FontWeight.bold,
                            letterSpacing: SpacingConfig.commonSpacing),
                      ),
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
