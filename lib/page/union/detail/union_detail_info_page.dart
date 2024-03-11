import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class UnionDetailInfoPage extends ConsumerWidget {
  const UnionDetailInfoPage({
    super.key,
    required this.unionGrade,
    required this.unionSubGrade,
    required this.unionLevel,
    required this.gradeType,
  });

  final String unionGrade;
  final String unionSubGrade;
  final String unionLevel;
  final bool gradeType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        /**----- union grade */
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: DimenConfig.subDimen),
          color: colorScheme.primary,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                  offset: Offset(-FontConfig.maxSize * (gradeType ? 4 : 3), 0),
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        colorScheme.primary,
                      ],
                    ).createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Image.asset('assets/bay_leap_left.png')),
                  )),
              Transform.translate(
                offset: Offset(FontConfig.maxSize * (gradeType ? 4 : 3), 0),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white,
                      colorScheme.primary,
                    ],
                  ).createShader(bounds),
                  blendMode: BlendMode.srcIn,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.asset('assets/bay_leap_right.png')),
                ),
              ),
              Column(
                children: [
                  CustomTextWidget(
                    text: unionGrade,
                    size: FontConfig.maxSize,
                    weight: FontWeight.bold,
                    color: Colors.white,
                    subColor: Colors.yellow,
                    shadowSize: 1,
                    shadowType: true,
                  ),
                  CustomTextWidget(
                    text: unionSubGrade,
                    size: FontConfig.commonSize,
                    weight: FontWeight.bold,
                    color: Colors.white,
                    subColor: Colors.yellow,
                    shadowSize: 1,
                    shadowType: true,
                  ),
                ],
              ),
            ],
          ),
        ),
        /**----- union grade icon */
        Container(
          margin: EdgeInsets.only(
              top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(
            'assets/maplespy_icon.png',
            fit: BoxFit.contain,
          ),
        ),
        /**----- union level */
        Container(
          margin: EdgeInsets.only(
              top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: FontConfig.maxSize),
                  alignment: Alignment.centerRight,
                  child: CustomTextWidget(
                    text: 'LEVEL',
                    textAlign: TextAlign.end,
                    size: FontConfig.commonSize,
                    weight: FontWeight.bold,
                    color: Colors.white,
                    subColor: Colors.yellow,
                    shadowSize: 1,
                    shadowType: true,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: FontConfig.commonSize),
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: '${unionLevel}',
                    textAlign: TextAlign.start,
                    size: FontConfig.maxSize,
                    weight: FontWeight.bold,
                    color: Colors.white,
                    subColor: Colors.yellow,
                    shadowSize: 1,
                    shadowType: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
