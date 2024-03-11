import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/page/union/detail/union_detail_crystal_info.dart';
import 'package:maplespy/provider/union_artifact_notifier.dart';

class UnionDetailArtifactCrystal extends ConsumerWidget {
  const UnionDetailArtifactCrystal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unionArtifactNotifier = ref.read(asyncUnionArtifactProvider.notifier);
    final unionArtifactCrystal = ref
        .watch(unionArtifactNotifier.unionArtifactProvider)
        .unionArtifactCrystal;

    return Container(
      margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: DimenConfig.commonDimen,
        runSpacing: DimenConfig.commonDimen,
        children: [
          for (var i = 0; i < unionArtifactCrystal!.length; i++)
            UnionDetailCrystalInfo(
              crystalName: StaticListConfig.unionArtifactCrystalList[i]!,
              crystalLevel: unionArtifactCrystal.elementAt(i).level,
            ),
          for (var i = unionArtifactCrystal.length; i < 9; i++)
            UnionDetailCrystalInfo(
              crystalName: StaticListConfig.unionArtifactCrystalList[i]!,
            ),
        ],
      ),
    );
  }
}
