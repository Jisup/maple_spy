import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/main_character_model.dart';
import 'package:maplespy/widget/character/character_info_widget.dart';

class CharacterInfo extends ConsumerWidget {
  const CharacterInfo({super.key, required this.character});

  final MainCharacter character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      /**Is active when provide character custom background of Maplestory API*/
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.fitHeight,
      //     image: AssetImage('assets/maple_mschristmas.jpg'),
      //   ),
      // ),
      child: Container(
        margin: EdgeInsets.only(
          top: DimenConfig.maxDimen,
          bottom: DimenConfig.maxDimen,
          left: DimenConfig.maxDimen / 2,
          right: DimenConfig.maxDimen / 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**-----character`s level with character`s class  */
            CharacterInfoWidget(
                title: 'Lv. ${character.basic!.characterLevel!}',
                value: character.basic!.characterClass!,
                type: true),
            /**-----image with character`s name */
            Expanded(
              child: Container(
                margin: EdgeInsets.all(DimenConfig.subDimen),
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(character.basic!.characterImage!),
                        fit: BoxFit.contain,
                        semanticLabel: '캐릭터 이미지',
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Container(
                        padding: EdgeInsets.all(DimenConfig.subDimen),
                        decoration: BoxDecoration(
                            color: CommonColor.infoMain,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(RadiusConfig.commonRadius),
                              right: Radius.circular(RadiusConfig.commonRadius),
                            )),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: FontConfig.middleSize,
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: DimenConfig.subDimen),
                                child: Image.asset(
                                  'assets/maplespy_icon.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              character.basic!.characterName!,
                              style: TextStyle(
                                fontSize: FontConfig.commonSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            /**-----character`s 전투력 */
            CharacterInfoWidget(
                title: '전투력',
                value: character.stat?.finalStat
                        ?.singleWhere((element) => element.statName == '전투력')
                        .statValue ??
                    '',
                type: true),
            /**-----character`s dojang */
            CharacterInfoWidget(
                title: '무릉도장',
                value: '${character.dojang?.dojangBestFloor.toString() ?? ''}층',
                type: false),
            /**-----character`s union */
            CharacterInfoWidget(
                title: '유니온',
                value: '${character.union?.unionLevel ?? ''}',
                detailPath: character.union?.unionLevel != null
                    ? '/character/union'
                    : null,
                pathType: '유니온',
                type: false),
            /**-----character`s guild */
            CharacterInfoWidget(
                title: '길드',
                value: character.basic?.characterGuildName ?? '',
                type: false),
          ],
        ),
      ),
      // ),
    );
  }
}
