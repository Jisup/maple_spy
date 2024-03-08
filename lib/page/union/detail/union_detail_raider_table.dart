import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionDetailRaiderTable extends ConsumerWidget {
  const UnionDetailRaiderTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final unionRaiderNotifier = ref.read(asyncUnionRaiderProvider.notifier);
    final unionRaider = ref.watch(unionRaiderNotifier.unionRaiderProvider);

    return Container(
      margin: EdgeInsets.only(
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen,
        left: DimenConfig.commonDimen * 2,
        right: DimenConfig.commonDimen * 2,
      ),
      child: LayoutBuilder(builder:
          (BuildContext childContext, BoxConstraints viewportConstraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: viewportConstraints.maxWidth,
            minHeight: viewportConstraints.maxWidth / 24 * 22,
          ),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            final innerFieldY = viewportConstraints.minHeight / 20 * 3.5;
            final innerFieldX = viewportConstraints.maxWidth / 22 * 3.75;
            final outerFieldY = viewportConstraints.minHeight / 20 * 7.5;
            final outerFieldX = viewportConstraints.maxWidth / 22 * 7.75;
            print(
                '${innerFieldY}/${innerFieldX}/${outerFieldY}/${outerFieldX}');
            final fieldType = [
              [-1, -1 / 2.25], // -y -x/2
              [-1, 1 / 2.25], // -y +x/2
              [-1 / 3, 1], // -y/2 +x
              [1 / 3, 1], // +y/2 +x
              [1, 1 / 2.25], // +y +x/2
              [1, -1 / 2.25], // +y -x/2
              [1 / 3, -1], // +y/2 -x
              [-1 / 3, -1], // -y/2 -x
            ];
            return Stack(alignment: Alignment.center, children: [
              Table(
                children: [
                  for (var column = 0; column < 22; column++)
                    TableRow(
                      children: [
                        for (var row = 0; row < 24; row++)
                          TableCell(
                            child: LayoutBuilder(
                              builder: (BuildContext chidlContext,
                                  BoxConstraints viewportConstraints) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: viewportConstraints.maxWidth,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: setBlockBorder(
                                      borderList: unionRaider
                                          .unionTableBorder[column][row],
                                      trueType: Colors.white,
                                    )),
                                    child: Container(
                                      decoration: unionRaider
                                              .unionTable[column][row].isExist
                                          ? BoxDecoration(
                                              // color: UnionColor.unionBackground,
                                              color: UnionColor
                                                  .unionBlockBackground,
                                              border: setBlockBorder(
                                                  borderList: unionRaider
                                                      .unionTable[column][row]
                                                      .border,
                                                  falseType: UnionColor
                                                      .unionBlockBackground),
                                            )
                                          : setBoxDecoration(
                                              column: column,
                                              row: row,
                                              startColor:
                                                  UnionColor.unionBackground,
                                              endColor: colorScheme.primary,
                                            ),
                                      child: Text(''),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    )
                ],
              ),
              for (var i = 0; i < 8; i++)
                Transform.translate(
                    offset: Offset(innerFieldX * fieldType[i][1],
                        innerFieldY * fieldType[i][0]),
                    child: CustomTextWidget(
                      text: unionRaider.unionInnerField[i],
                      textAlign: TextAlign.center,
                      size: FontConfig.subSize,
                      color: Colors.white,
                      subColor: Colors.black26,
                      shadowSize: 2,
                    )),
              for (var i = 0; i < 8; i++)
                Transform.translate(
                    offset: Offset(outerFieldX * fieldType[i][1],
                        outerFieldY * fieldType[i][0]),
                    child: CustomTextWidget(
                      text: unionRaider.unionOuterField[i],
                      textAlign: TextAlign.center,
                      size: FontConfig.subSize,
                      color: Colors.white,
                      subColor: Colors.black26,
                      shadowSize: 2,
                    )),
            ]);
          }),
        );
      }),
    );
  }
}

Border setBlockBorder({
  required List<bool> borderList,
  Color? trueType,
  Color? falseType,
}) {
  return Border(
    top: borderList[0]
        ? trueType != null
            ? BorderSide(color: trueType)
            : BorderSide.none
        : falseType != null
            ? BorderSide(color: falseType)
            : BorderSide.none,
    bottom: borderList[1]
        ? trueType != null
            ? BorderSide(color: trueType)
            : BorderSide.none
        : falseType != null
            ? BorderSide(color: falseType)
            : BorderSide.none,
    left: borderList[2]
        ? trueType != null
            ? BorderSide(color: trueType)
            : BorderSide.none
        : falseType != null
            ? BorderSide(color: falseType)
            : BorderSide.none,
    right: borderList[3]
        ? trueType != null
            ? BorderSide(color: trueType)
            : BorderSide.none
        : falseType != null
            ? BorderSide(color: falseType)
            : BorderSide.none,
  );
}

BoxDecoration setBoxDecoration({
  required column,
  required row,
  required Color startColor,
  required Color endColor,
}) {
  return column == 0
      ? BoxDecoration(
          gradient: LinearGradient(
          begin: row == 0
              ? Alignment.bottomRight
              : row == 23
                  ? Alignment.bottomLeft
                  : Alignment.bottomCenter,
          end: row == 0
              ? Alignment.topLeft
              : row == 23
                  ? Alignment.topRight
                  : Alignment.topCenter,
          colors: row == 0 || row == 23
              ? [
                  startColor,
                  endColor,
                  endColor,
                ]
              : [
                  startColor,
                  endColor,
                ],
        ))
      : column == 21
          ? BoxDecoration(
              gradient: LinearGradient(
              begin: row == 0
                  ? Alignment.topRight
                  : row == 23
                      ? Alignment.topLeft
                      : Alignment.topCenter,
              end: row == 0
                  ? Alignment.bottomLeft
                  : row == 23
                      ? Alignment.bottomRight
                      : Alignment.bottomCenter,
              colors: row == 0 || row == 23
                  ? [
                      startColor,
                      endColor,
                      endColor,
                    ]
                  : [
                      startColor,
                      endColor,
                    ],
            ))
          : row == 0
              ? BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    startColor,
                    endColor,
                  ],
                ))
              : row == 23
                  ? BoxDecoration(
                      gradient: LinearGradient(
                      colors: [
                        startColor,
                        endColor,
                      ],
                    ))
                  : BoxDecoration(
                      color: startColor,
                    );
}
