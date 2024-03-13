import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/main_controller.dart';
import 'package:maplespy/model/firestore/character.dart';
import 'package:maplespy/widget/character/character_info_widget.dart';

class UnionDetailCharacter extends ConsumerWidget {
  const UnionDetailCharacter({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.only(
        top: DimenConfig.subDimen,
        bottom: DimenConfig.subDimen,
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      width:
          (MediaQuery.of(context).size.width - DimenConfig.commonDimen) / 2.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // SkillColor.startBackground,
              colorScheme.onPrimary,
              SkillColor.endBackground,
            ]),
        border: Border.all(
          color: colorScheme.primary,
          width: 0.25,
        ),
        borderRadius: BorderRadius.circular(RadiusConfig.commonRadius),
      ),
      child: Column(
        children: [
          Stack(children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Image(
                image: NetworkImage(character.characterImage!),
                fit: BoxFit.contain,
                semanticLabel: '캐릭터 이미지',
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(top: DimenConfig.subDimen),
                child: GestureDetector(
                  onTap: () => ref
                      .read(mainControllerProvider.notifier)
                      .onClickSearchButton(
                        characterName: character.characterName!,
                        union: true,
                      ),
                  child: Icon(
                    Icons.open_in_new,
                    size: FontConfig.maxSize,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ]),
          Container(
            margin: EdgeInsets.all(DimenConfig.subDimen),
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
                // SizedBox(
                //   height: FontConfig.middleSize,
                //   child: Container(
                //     margin: EdgeInsets.only(right: DimenConfig.subDimen),
                //     child: Image.asset(
                //       'assets/maplespy_icon.png',
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
                Text(
                  character.characterName!,
                  style: TextStyle(
                    fontSize: FontConfig.commonSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CharacterInfoWidget(
            value: 'Lv. ${character.characterLevel}',
            type: true,
          ),
          CharacterInfoWidget(value: character.characterClass!, type: true),
        ],
      ),
    );
  }
}
