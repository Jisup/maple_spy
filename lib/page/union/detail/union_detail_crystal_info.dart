import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionDetailCrystalInfo extends ConsumerWidget {
  const UnionDetailCrystalInfo({
    super.key,
    required this.crystalName,
    this.crystalLevel,
  });

  final String crystalName;
  final int? crystalLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder:
          (BuildContext childContext, BoxConstraints viewportConstraints) =>
              ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: viewportConstraints.maxWidth / 3.19,
          maxWidth: viewportConstraints.maxWidth / 3.19,
          minHeight: viewportConstraints.maxWidth / 3.19 / 3 * 4,
          maxHeight: viewportConstraints.maxWidth / 3.19 / 3 * 4,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      UnionColor.unionArtifactStartBackground,
                      UnionColor.unionArtifactEndBackground,
                    ]),
                border: Border.all(
                  color: UnionColor.unionArtifactBorder,
                  width: StrokeConfig.maxWidth,
                ),
                borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
              ),
              child: CustomTextWidget(
                text: crystalName,
                size: FontConfig.commonSize,
                color: Colors.white,
                subColor: UnionColor.unionArtifactTextShadow,
                shadowType: true,
              ),
            ),
            crystalLevel != null
                ? Positioned(
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: DimenConfig.commonDimen),
                      child: Wrap(
                        spacing: DimenConfig.minDimen,
                        children: [
                          for (var i = 0; i < crystalLevel!; i++)
                            CustomTextWidget(
                              text: '◆',
                              size: FontConfig.subSize,
                              color: Colors.white,
                              subColor: UnionColor.unionArtifactLevelIconShadow,
                              shadowType: true,
                            ),
                        ],
                      ),
                    ))
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
