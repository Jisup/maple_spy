import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/skill/skill_info_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/make_list.dart';
import 'package:maplespy/widget/common/custom_paint_text_widget.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';
import 'package:maplespy/widget/main_container/detail_app_bar.dart';

class SkillDetailPage extends ConsumerWidget {
  const SkillDetailPage({super.key, required this.skillInfo});

  final SkillInfo skillInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterName = ref.read(characterNameProvider);
    final characterWorld = ref.read(characterWorldProvider);

    /**
     * 링크 스킬은 그냥 주어진거로 하면됨
     * V 스킬은 슬릇 업그레이드 횟수를 확인해야 하므로 VDetail이랑 함께 사용할 것, 따로 추가 로직만들어야 하진 않음
     * -> 잘 모르겠으면 v_skill_info_view에 사용된 값 확인할 것
     * HEXA 스킬은 HEXA 매트릭스에서 core를 가져오므로, 그 core의 name으로 6차 스킬 목록에서 일치하는 값을 가져와서 사용해야함
     */
    final masterLevel = skillInfo.description!
        .split('\r\n')
        .first
        .replaceAll(RegExp('[^0-9]'), '');
    final description = skillInfo.description!.split('\r\n').last;

    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(
            context: context,
            characterName: characterName,
            characterWorld: characterWorld),
        body: LayoutBuilder(
          builder: (childContext, viewportConstraints) => ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              color: EquipmentColor.detailBackground,
              padding: EdgeInsets.only(bottom: DimenConfig.maxDimen),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: DimenConfig.maxDimen,
                      margin: EdgeInsets.only(
                          top: DimenConfig.commonDimen,
                          left: DimenConfig.commonDimen * 2,
                          right: DimenConfig.commonDimen * 2),
                      alignment: Alignment.centerLeft,
                      child: StaticSwitchConfig.switchSkillIsOrigin(
                              name: skillInfo.name!)
                          ? Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 24,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        SkillColor.originStartBorder,
                                        SkillColor.originEndBorder
                                      ]),
                                  borderRadius: BorderRadius.circular(
                                      RadiusConfig.maxRadius),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black,
                                    )
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          SkillColor.originStartBackground,
                                          SkillColor.originEndBackground
                                        ]),
                                    borderRadius: BorderRadius.circular(
                                        RadiusConfig.maxRadius)),
                                alignment: Alignment.center,
                                child: Text(
                                  'ORIGIN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: SkillColor.commonInfoText,
                                      fontSize: FontConfig.subSize,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, -2),
                                          color: SkillColor.originTextShadow,
                                        )
                                      ]),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: DimenConfig.commonDimen * 2,
                        right: DimenConfig.commonDimen * 2,
                        bottom: DimenConfig.commonDimen * 2,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    RadiusConfig.commonRadius +
                                        RadiusConfig.littleRadius),
                                boxShadow: fourDirectionBoxShadow(
                                    d: 1,
                                    blurRadius: 1,
                                    color:
                                        StaticSwitchConfig.switchSkillIsOrigin(
                                                name: skillInfo.name!)
                                            ? SkillColor.originStartBorder
                                            : SkillColor.commonInfoText)),
                            child: Image.network(
                              skillInfo.icon!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.width / 4,
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    skillInfo.name!,
                                    style: TextStyle(
                                      color: SkillColor.commonInfoText,
                                      fontSize: FontConfig.middleSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '[마스터 레벨 : ${masterLevel}${skillInfo.slotLevel != null ? ' + ${skillInfo.slotLevel}' : ''}]',
                                        style: TextStyle(
                                            color: SkillColor.commonInfoText),
                                      ),
                                      skillInfo.slotLevel != null
                                          ? Text(
                                              '(슬릇 강화 효과 + ${skillInfo.slotLevel})',
                                              style: TextStyle(
                                                  color:
                                                      SkillColor.subInfoText),
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: DimenConfig.commonDimen * 2,
                          right: DimenConfig.commonDimen * 2,
                          bottom: DimenConfig.commonDimen,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description,
                              style:
                                  TextStyle(color: SkillColor.commonInfoText),
                            ),
                            skillInfo.subDescription != null
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: DimenConfig.commonDimen * 2),
                                    child: Text(
                                      skillInfo.subDescription!,
                                      style: TextStyle(
                                          color: SkillColor.subInfoText),
                                    ))
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                    DashedDividerWidget(),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                          margin: EdgeInsets.only(
                            top: DimenConfig.commonDimen,
                            left: DimenConfig.commonDimen * 2,
                            right: DimenConfig.commonDimen * 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '[현재레벨 ${skillInfo.level}]',
                                style:
                                    TextStyle(color: SkillColor.commonInfoText),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: skillInfo.effect!
                                    .split('\n')
                                    .map(
                                      (effect) => CustomPaintTextWidget(
                                          content: effect,
                                          fixed: ':',
                                          color: SkillColor.subInfoText),
                                    )
                                    .toList(),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
