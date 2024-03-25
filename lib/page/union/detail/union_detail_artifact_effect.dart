import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/union_artifact_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionDetailArtifactEffect extends ConsumerWidget {
  const UnionDetailArtifactEffect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unionArtifactNotifier = ref.read(asyncUnionArtifactProvider.notifier);
    final unionArtifactEffect = ref
        .watch(unionArtifactNotifier.unionArtifactProvider)
        .unionArtifactEffect;

    return unionArtifactEffect != null && unionArtifactEffect.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: '아티팩트 효과',
                    size: FontConfig.middleDownSize,
                    color: Colors.black,
                  ),
                ),
                Wrap(
                  runSpacing: DimenConfig.subDimen,
                  children: unionArtifactEffect
                      .map((effect) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  margin: EdgeInsets.only(
                                      right: DimenConfig.commonDimen),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Lv. '),
                                      Text('${effect.level}  |'),
                                    ],
                                  )),
                              Expanded(child: Text(effect.name!)),
                            ],
                          ))
                      .toList(),
                )
              ],
            ),
          )
        : MainErrorPage(
            message: ErrorMessageConfig.unionArtifactEffactVariableError);
  }
}
