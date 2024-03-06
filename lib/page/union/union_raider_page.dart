import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/detail/union_detail_info_page.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';

class UnionRaiderPage extends ConsumerWidget {
  const UnionRaiderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final unionRaiderNotifier = ref.read(asyncUnionRaiderProvider.notifier);
    final union = ref.watch(unionRaiderNotifier.unionProvider);
    final unionRaider = ref.watch(unionRaiderNotifier.unionRaiderProvider);

    return Container(
      padding: EdgeInsets.all(DimenConfig.commonDimen * 2),
      color: colorScheme.primary,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: viewportConstraints.maxWidth,
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Container(
            child: SingleChildScrollView(
              child: union.unionGrade != null
                  ? Column(
                      children: [
                        UnionDetailInfoPage(
                          unionGrade: union.unionGrade!,
                          unionSubGrade: union.unionSubGrade!,
                          unionLevel: union.unionLevel ?? '0',
                          gradeType: union.unionGrade?.contains('그랜드') ?? false,
                        ),
                      ],
                    )
                  : MainErrorPage(
                      message: ErrorMessageConfig.unionRaiderPageVariableError),
            ),
          ),
        ),
      ),
    );
  }
}
