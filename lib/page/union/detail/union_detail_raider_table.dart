import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';

class UnionDetailRaiderTable extends ConsumerWidget {
  const UnionDetailRaiderTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unionRaiderNotifier = ref.read(asyncUnionRaiderProvider.notifier);
    final unionRaider = ref.watch(unionRaiderNotifier.unionRaiderProvider);

    return Container(
      margin: EdgeInsets.only(
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen,
        left: DimenConfig.commonDimen * 2,
        right: DimenConfig.commonDimen * 2,
      ),
      color: Colors.red,
      child: Table(
        border: TableBorder.all(color: UnionColor.unionBackground),
        children: [
          for (var column = 0; column < 20; column++)
            TableRow(
              children: [
                for (var row = 0; row < 22; row++)
                  TableCell(
                    child: LayoutBuilder(
                      builder: (BuildContext chidlContext,
                          BoxConstraints viewportConstraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: viewportConstraints.maxWidth,
                          ),
                          child: Container(
                            color: UnionColor.unionBackground,
                            child: Text(''),
                          ),
                        );
                      },
                    ),
                  )
              ],
            )
        ],
      ),
    );
  }
}
