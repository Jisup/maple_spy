import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';

class AbilityDetailLockPage extends ConsumerWidget {
  const AbilityDetailLockPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
          padding: EdgeInsets.all(DimenConfig.minDimen),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: StatColor.statBackground,
            borderRadius: BorderRadius.circular(RadiusConfig.minRadius),
          ),
          child: Icon(
            Icons.lock,
            size: FontConfig.middleSize,
            color: Colors.white,
            semanticLabel: '비 활성화',
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: DimenConfig.commonDimen,
            right: DimenConfig.commonDimen,
            bottom: DimenConfig.commonDimen,
          ),
          padding: EdgeInsets.all(DimenConfig.commonDimen),
          decoration: BoxDecoration(
            color: StatColor.statBackground,
            borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          ),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: DimenConfig.subDimen),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                  )),
              Text(
                '어빌리티가 활성화되지 않았습니다.',
                style: TextStyle(
                  fontSize: FontConfig.commonSize + 1,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
