import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/detail/union_detail_character.dart';
import 'package:maplespy/provider/union_character_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionCharacterPage extends ConsumerWidget {
  const UnionCharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final unionRankingNotifier = ref.read(asyncUnionCharacterProvider.notifier);
    final unionMainCharacter =
        ref.watch(unionRankingNotifier.unionMainCharacterProvider);

    final unionSubCharacter =
        ref.watch(unionRankingNotifier.unionSubCharacterProvider);

    return Container(
      margin: EdgeInsets.only(
        bottom: DimenConfig.commonDimen * 2,
        left: DimenConfig.commonDimen * 2,
        right: DimenConfig.commonDimen * 2,
      ),
      child: LayoutBuilder(
        builder:
            (BuildContext childContext, BoxConstraints viewportConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
              minHeight: viewportConstraints.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                    alignment: Alignment.centerLeft,
                    child: CustomTextWidget(
                      text: '본캐',
                      size: FontConfig.middleDownSize,
                      color: Colors.black,
                    ),
                  ),
                  UnionDetailCharacter(
                    character: unionMainCharacter,
                  ),
                  Semantics(
                    label: '구분 선',
                    readOnly: true,
                    child: Container(
                      margin: EdgeInsets.only(top: DimenConfig.commonDimen),
                      child: Divider(
                          height: DimenConfig.commonDimen * 2,
                          thickness: 2,
                          color: colorScheme.primary),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                    alignment: Alignment.centerLeft,
                    child: CustomTextWidget(
                      text: '부캐',
                      size: FontConfig.middleDownSize,
                      color: Colors.black,
                    ),
                  ),
                  unionSubCharacter.isNotEmpty
                      ? Wrap(
                          spacing: DimenConfig.commonDimen,
                          runSpacing: DimenConfig.commonDimen,
                          children: unionSubCharacter
                              .map((subCharacter) =>
                                  UnionDetailCharacter(character: subCharacter))
                              .toList(),
                        )
                      : MainErrorPage(
                          message: ErrorMessageConfig
                              .unionSubCharacterVariableError),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
