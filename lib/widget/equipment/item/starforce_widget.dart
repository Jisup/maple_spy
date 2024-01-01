import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';

class StarforceWidget extends ConsumerWidget {
  const StarforceWidget(
      {super.key, required this.level, required this.starforce});

  final int level;
  final int starforce;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> makeStarforceImage(int start, int end) {
      return [
        for (var i = start; i < end; i++)
          Container(
              margin: i % 5 == 0
                  ? EdgeInsets.only(left: DimenConfig.commonDimen)
                  : EdgeInsets.zero,
              child: FractionallySizedBox(
                  widthFactor: 0.05,
                  child: Image.asset(i < starforce
                      ? 'assets/star_icon.png'
                      : 'assets/star_deactive_icon.png')))
      ];
    }

    Widget makeStarforce(int len) {
      return Wrap(
        alignment: WrapAlignment.center,
        runSpacing: DimenConfig.commonDimen,
        children: len < 15
            ? makeStarforceImage(0, len)
            : [
                Wrap(
                  children: makeStarforceImage(0, 15),
                ),
                Wrap(
                  children: makeStarforceImage(15, len),
                ),
              ],
      );
    }

    if (level < 95) {
      // 5
      return makeStarforce(5);
    } else if (95 <= level && level < 108) {
      // 8
      return makeStarforce(8);
    } else if (108 <= level && level < 118) {
      // 10
      return makeStarforce(10);
    } else if (118 <= level && level < 128) {
      // 15
      return makeStarforce(15);
    } else if (128 <= level && level < 138) {
      // 20
      return makeStarforce(20);
    } else {
      // 25
      return makeStarforce(25);
    }
  }
}
