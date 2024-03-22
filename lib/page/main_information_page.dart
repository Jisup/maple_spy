import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';

class MainInforMationPage extends ConsumerWidget {
  const MainInforMationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          leading: GestureDetector(
            onTap: () => context.go('/'),
            child: Icon(
              Icons.navigate_before_rounded,
              color: Colors.white,
              semanticLabel: '뒤로 가기 버튼',
            ),
          ),
          title: Text(
            'MapleSpy',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colorScheme.onPrimary, fontFamily: 'Maplestory'),
          ),
        ),
        body: LayoutBuilder(
          builder:
              (BuildContext childContext, BoxConstraints viewportConstraints) =>
                  ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(DimenConfig.maxDimen),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: DimenConfig.commonDimen,
                  children: [
                    Text(
                      '[이용 안내]',
                      style: TextStyle(
                        fontSize: FontConfig.middleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Semantics(
                      label: '구분 선',
                      readOnly: true,
                      child: Divider(
                        color: colorScheme.primary,
                        height: DimenConfig.commonDimen,
                        thickness: 2,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                            text: 'MapleSpy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text:
                                  '는\n메이플스토리 캐릭터의 다양한 정보를\n조회할 수 있는 애플리케이션입니다.'),
                        ]),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Text(
                        '2023년 12월 21일 데이터 부터\n실시간으로 조회할 수 있으며,\n평균 15분의 데이터 갱신 시간이 필요합니다.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Text(
                        '단, 일일 제한 요청량이 초과할 경우\n서비스 이용이 불가능할 수 있습니다.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                            top:
                                DimenConfig.maxDimen - DimenConfig.commonDimen),
                        alignment: Alignment.center,
                        child: Text(
                          '[서비스 안내]',
                          style: TextStyle(
                            fontSize: FontConfig.middleDownSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Semantics(
                      label: '구분 선',
                      readOnly: true,
                      child: Divider(
                        color: colorScheme.primary,
                        height: DimenConfig.commonDimen,
                        thickness: 2,
                      ),
                    ),
                    ...StaticListConfig.serviceInformationList
                        .map((info) => FractionallySizedBox(
                              widthFactor: 1,
                              child: Text.rich(TextSpan(
                                children: [
                                  TextSpan(text: info['header']),
                                  TextSpan(
                                    text: info['main'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(text: info['footer']),
                                ],
                              )),
                            ))
                        .toList(),
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
