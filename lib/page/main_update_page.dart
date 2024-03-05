import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:url_launcher/url_launcher.dart';

class MainUpdatePage extends ConsumerStatefulWidget {
  const MainUpdatePage({
    super.key,
    required this.oldVersion,
    required this.newVersion,
  });

  final oldVersion;
  final newVersion;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainUpdatePageState();
}

class _MainUpdatePageState extends ConsumerState<MainUpdatePage> {
  @override
  void initState() {
    super.initState();
  }

  void clickUpdate() {
    // store redirect
    if (Platform.isAndroid || Platform.isIOS) {
      final appId = Platform.isAndroid
          ? dotenv.get('ANDROID_PACKAGE_NAME')
          : dotenv.get('IOS_APP_ID');
      final url = Uri.parse(
        Platform.isAndroid
            ? 'market://details?id=${appId}'
            : 'https://apps.apple.com/app/id${appId}',
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: colorScheme.primary,
          padding: EdgeInsets.only(
            top: DimenConfig.maxDimen * 2,
            bottom: DimenConfig.maxDimen * 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: DimenConfig.maxDimen / 2),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                      child: Text('MapleSpy',
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontSize: FontConfig.maxSize * 2,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Maplestory',
                          )),
                    ),
                    Text('v${widget.oldVersion} → v${widget.newVersion}',
                        style: TextStyle(
                          color: colorScheme.onSecondary,
                          fontSize: FontConfig.middleSize,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: DimenConfig.maxDimen / 2,
                    bottom: DimenConfig.maxDimen / 2),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                      child: Text('앱 업데이트 안내',
                          style: TextStyle(
                            color: colorScheme.tertiary,
                            fontSize: FontConfig.maxSize,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Text('더 나은 서비스 이용을 위해',
                        style: TextStyle(
                          color: colorScheme.onSecondary,
                          fontSize: FontConfig.commonSize,
                        )),
                    Text('최신 버전으로 업데이트해주세요.',
                        style: TextStyle(
                          color: colorScheme.onSecondary,
                          fontSize: FontConfig.commonSize,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => clickUpdate(),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(RadiusConfig.maxRadius),
                  ),
                  margin: EdgeInsets.only(top: DimenConfig.maxDimen / 2),
                  padding: EdgeInsets.only(
                    top: DimenConfig.commonDimen,
                    bottom: DimenConfig.commonDimen,
                    left: DimenConfig.commonDimen * 2,
                    right: DimenConfig.commonDimen * 2,
                  ),
                  child: Text(
                      Platform.isAndroid
                          ? 'Google PlayStore 이동'
                          : 'App Store 이동',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
