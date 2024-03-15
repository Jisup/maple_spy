import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/firestore/notice.dart';

class MainNoticePage extends ConsumerWidget {
  const MainNoticePage({super.key, required this.notice});

  final Notice notice;

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
                  runSpacing: DimenConfig.commonDimen * 2,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Text(
                        '[공지 사항]',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: FontConfig.middleSize,
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
                    Text(
                      notice.title!,
                      style: TextStyle(
                        fontSize: FontConfig.middleDownSize,
                      ),
                    ),
                    Text(notice.body!),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Text(
                        notice.date!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(notice.footer!),
                    Semantics(
                      label: '구분 선',
                      readOnly: true,
                      child: Divider(
                        color: colorScheme.primary,
                        height: DimenConfig.commonDimen,
                        thickness: 2,
                      ),
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
