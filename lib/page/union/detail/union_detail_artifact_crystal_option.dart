import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/union_artifact_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionDetailArtifactCrystalOption extends ConsumerWidget {
  const UnionDetailArtifactCrystalOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final unionArtifactNotifier = ref.read(asyncUnionArtifactProvider.notifier);
    final unionArtifactCrystal = ref
        .watch(unionArtifactNotifier.unionArtifactProvider)
        .unionArtifactCrystal;

    return unionArtifactCrystal != null && unionArtifactCrystal.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(bottom: DimenConfig.commonDimen * 2),
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: '크리스탈 옵션',
                  size: FontConfig.middleDownSize,
                  color: Colors.black,
                ),
              ),
              Wrap(
                children: unionArtifactCrystal
                    .map((crystal) => Column(
                          children: [
                            Semantics(
                              label: '구분 선',
                              readOnly: true,
                              child: Divider(
                                  height: DimenConfig.commonDimen * 2,
                                  thickness: 0.25,
                                  color: colorScheme.secondary),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        margin: EdgeInsets.only(
                                            right: DimenConfig.commonDimen),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${crystal.name}',
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            Text('|'),
                                          ],
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        child: Text('Lv. ${crystal.level}')),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(crystal.crystalOptionName1!),
                                      Text(crystal.crystalOptionName2!),
                                      Text(crystal.crystalOptionName3!),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ]))
        : MainErrorPage(
            message: ErrorMessageConfig.unionArtifactCrystalVraibaleError);
  }
}
