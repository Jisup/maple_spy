import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexagon/hexagon.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class HexaDetailLevelPage extends ConsumerWidget {
  const HexaDetailLevelPage({
    super.key,
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
          child: HexagonWidget.flat(
            width: MediaQuery.of(context).size.width / 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white54, StatColor.statHexaSubBorder],
                ),
              ),
              child: HexagonWidget.flat(
                width: MediaQuery.of(context).size.width / 4 -
                    DimenConfig.subDimen,
                child: Container(
                  color: StatColor.statHexaBorder,
                  child: HexagonWidget.flat(
                    width: MediaQuery.of(context).size.width / 4 -
                        (DimenConfig.subDimen * 3),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            StatColor.statHexaSubBorder,
                            StatColor.statHexaStartBackground
                          ],
                        ),
                      ),
                      child: HexagonWidget.flat(
                        width: MediaQuery.of(context).size.width / 4 -
                            (DimenConfig.subDimen * 4),
                        child: FractionallySizedBox(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  StatColor.statHexaStartBackground,
                                  StatColor.statHexaMiddleBackground,
                                  StatColor.statHexaEndBackground,
                                ],
                              ),
                            ),
                            child: CustomTextWidget(
                              text: '${level}',
                              size: FontConfig.maxSize,
                              color: Colors.white,
                              subColor: Colors.white30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CustomTextWidget(
            text: 'LEVEL',
            size: FontConfig.middleSize,
            weight: FontWeight.bold,
            color: Colors.white,
            subColor: Colors.white30,
          ),
        ),
        Positioned(
          bottom: 0,
          child: ShaderMask(
            shaderCallback: (Rect bounds) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  StatColor.statHexaStartText,
                  StatColor.statHexaEndText,
                ]).createShader(bounds),
            child: CustomTextWidget(
              text: 'LEVEL',
              size: FontConfig.middleSize,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
