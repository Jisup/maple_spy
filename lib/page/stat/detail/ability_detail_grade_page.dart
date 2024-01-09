import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/util/make_list.dart';

class AbilityDetailGradePage extends ConsumerWidget {
  const AbilityDetailGradePage({super.key, required this.grade});

  final String? grade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen,
      ),
      padding: EdgeInsets.all(DimenConfig.commonDimen),
      decoration: BoxDecoration(
        gradient: grade != null
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    StaticSwitchConfig.statStartBackgroundColor[grade]!,
                    StaticSwitchConfig.statEndBackgroundColor[grade]!,
                  ])
            : null,
        color: grade == null ? StatColor.statBackgroundColor : null,
        border: grade != null
            ? Border.all(color: StaticSwitchConfig.statBorderColor[grade]!)
            : null,
        borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
        boxShadow: grade != null
            ? [
                BoxShadow(
                  blurStyle: BlurStyle.solid,
                  offset: Offset(0, 2),
                  color: StaticSwitchConfig.statBackgroundColor[grade]!,
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: DimenConfig.subDimen),
              child: Icon(
                grade != null ? Icons.bookmark_sharp : Icons.lock,
                color: Colors.white,
                shadows: grade != null
                    ? customDirectionShadow(
                        direction: 'top_left',
                        d: 2,
                        color: StaticSwitchConfig.statBorderColor[grade]!,
                      )
                    : null,
              )),
          Text(
            grade != null ? '${grade} 어빌리티' : '어빌리티가 활성화되지 않았습니다.',
            style: TextStyle(
              fontSize: FontConfig.commonSize + 1,
              color: Colors.white,
              shadows: grade != null
                  ? [
                      Shadow(
                        offset: Offset(0, -1),
                        color: StaticSwitchConfig.statBorderColor[grade]!,
                      )
                    ]
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
