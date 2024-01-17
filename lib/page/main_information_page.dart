import 'package:flutter/material.dart';
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
            onTap: () => context.pop(),
            child: Icon(
              Icons.navigate_before_rounded,
              color: Colors.white,
              semanticLabel: '뒤로 가기 버튼',
            ),
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
                    Text.rich(
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
                                '는\n메이플스토리의 캐릭터의 다양한 정보를\n조회할 수 있는 애플리케이션입니다.'),
                      ]),
                    ),
                    Text(
                      '2023년 12월 21일 데이터부터 조회할 수 있으며,\n매일 오전 1시를 기준으로 데이터가 갱신됩니다.',
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: DimenConfig.maxDimen - DimenConfig.commonDimen),
                      child: Text(
                        '[서비스 안내]',
                        style: TextStyle(
                          fontSize: FontConfig.middleDownSize,
                          fontWeight: FontWeight.bold,
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
