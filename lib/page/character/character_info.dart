import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/main_character_model.dart';
import 'package:maple_app/widget/character/character_info_widget.dart';

class CharacterInfo extends ConsumerWidget {
  const CharacterInfo({super.key, required this.character});

  final MainCharacter character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        /**Is active when provide character custom background of Maplestory API*/
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       fit: BoxFit.cover,
        //       image: NetworkImage(character.basic!.characterImage!)),
        // ),
        child: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          margin: EdgeInsets.fromLTRB(DimenConfig.maxDimen, 0, DimenConfig.maxDimen, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /**-----character`s level with character`s class  */
              CharacterInfoWidget(title: 'Lv. ${character.basic!.characterLevel!}', value: character.basic!.characterClass!, type: true),
              /**-----image with character`s name */
              Container(
                margin: EdgeInsets.all(DimenConfig.subDimen),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Image(
                        image: NetworkImage(character.basic!.characterImage!),
                        fit: BoxFit.contain,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Container(
                        padding: EdgeInsets.all(DimenConfig.subDimen),
                        decoration: BoxDecoration(
                            color: CommonColor.infoMainColor,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(RadiusConfig.commonRadius),
                              right: Radius.circular(RadiusConfig.commonRadius),
                            )),
                        alignment: Alignment.center,
                        child: Text(
                          character.basic!.characterName!,
                          style: TextStyle(
                            fontSize: FontConfig.commonSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /**-----character`s 전투력 */
              CharacterInfoWidget(title: '전투력', value: '1억 5235만 1235', type: true),
              /**-----character`s dojang */
              CharacterInfoWidget(title: '무릉도장', value: '60층', type: false),
              /**-----character`s union */
              CharacterInfoWidget(title: '유니온', value: '10582', type: false),
              /**-----character`s guild */
              CharacterInfoWidget(title: '길드', value: '꿈속', type: false),
            ],
          ),
        ),
      ),
    ));
  }
}
