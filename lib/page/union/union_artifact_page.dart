import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/union/detail/union_detail_artifact_crystal.dart';
import 'package:maplespy/page/union/detail/union_detail_artifact_crystal_option.dart';
import 'package:maplespy/page/union/detail/union_detail_artifact_effect.dart';

class UnionArtifactPage extends ConsumerWidget {
  const UnionArtifactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) =>
          ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: viewportConstraints.maxWidth,
          minHeight: viewportConstraints.maxHeight,
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: DimenConfig.commonDimen * 2,
              right: DimenConfig.commonDimen * 2,
              bottom: DimenConfig.commonDimen * 2,
            ),
            child: Column(
              children: [
                const UnionDetailArtifactCrystal(),
                Semantics(
                  label: '구분 선',
                  readOnly: true,
                  child: Divider(
                      height: DimenConfig.commonDimen * 2,
                      thickness: 2,
                      color: colorScheme.primary),
                ),
                const UnionDetailArtifactEffect(),
                Semantics(
                  label: '구분 선',
                  readOnly: true,
                  child: Divider(
                      height: DimenConfig.commonDimen * 2,
                      thickness: 2,
                      color: colorScheme.primary),
                ),
                const UnionDetailArtifactCrystalOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
