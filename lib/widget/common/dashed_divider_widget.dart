import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';

class DashedDividerWidget extends ConsumerWidget {
  const DashedDividerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double conatinerHeight = 4;
    return Container(
        height: conatinerHeight,
        margin: EdgeInsets.only(
            top: DimenConfig.commonDimen, bottom: DimenConfig.commonDimen),
        color: Colors.black87,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            double boxWidth = viewportConstraints.constrainWidth();
            double dashWidth = 4;
            double dashHeight = conatinerHeight / 2;
            int dashLenght = (boxWidth / (2 * dashWidth)).floor();
            return Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(dashLenght, (_) {
                return Column(
                  children: [
                    SizedBox(
                        width: dashWidth,
                        height: dashHeight / 2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        )),
                    SizedBox(
                        width: dashWidth,
                        height: dashHeight / 2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: ItemColor.deactiveOptionText),
                        )),
                  ],
                );
              }),
            );
          },
        ));
  }
}
