import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionDetailRaiderInfo extends ConsumerWidget {
  const UnionDetailRaiderInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unionRaiderNotifier = ref.read(asyncUnionRaiderProvider.notifier);
    final raiderInfo =
        ref.watch(unionRaiderNotifier.unionRaiderProvider).unionInfo;

    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen * 2,
        right: DimenConfig.commonDimen * 2,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
            alignment: Alignment.centerLeft,
            child: CustomTextWidget(
              text: '공격대원 정보',
              size: FontConfig.middleDownSize,
              color: Colors.black,
            ),
          ),
          Wrap(
              runSpacing: DimenConfig.commonDimen,
              children: raiderInfo
                  .map((info) => FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 8,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.all(DimenConfig.minDimen),
                                    child: Image.asset(
                                      'assets/maplespy_icon.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Transform.translate(
                                      offset: Offset(0, DimenConfig.subDimen),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                            left: DimenConfig.subDimen,
                                            right: DimenConfig.subDimen,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: UnionColor
                                                    .unionBlockBackground),
                                            borderRadius: BorderRadius.circular(
                                                RadiusConfig.minRadius),
                                          ),
                                          child: ShaderMask(
                                            shaderCallback: (bounds) =>
                                                LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                  UnionColor.unionStartText,
                                                  UnionColor.unionEndText,
                                                ]).createShader(bounds),
                                            child: CustomTextWidget(
                                              text: StaticSwitchConfig
                                                  .switchUnionCardGrade(
                                                characterClass:
                                                    info.characterClass,
                                                characterLevel:
                                                    info.characterLevel,
                                              ),
                                              size: FontConfig.subSize,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white,
                                              subColor: Colors.black26,
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // margin:
                              //     EdgeInsets.only(left: DimenConfig.subDimen),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(info.characterClass),
                                  Text('Lv. ${info.characterLevel}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
