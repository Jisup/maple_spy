import 'dart:async';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaml/yaml.dart';

class MainInsertPage extends ConsumerStatefulWidget {
  const MainInsertPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainInsertPageState();
}

class _MainInsertPageState extends ConsumerState<MainInsertPage> {
  late bool versionMatch;

  @override
  void initState() {
    super.initState();

    versionMatch = true;
    checkApplicationVersion();
  }

  void checkApplicationVersion() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(milliseconds: 1500),
      minimumFetchInterval: Duration(hours: 24),
    ));
    remoteConfig.setDefaults({
      'latest_version': '0.0.0',
    });
    await remoteConfig.fetchAndActivate();

    var remoteLatestVersion =
        remoteConfig.getString('latest_version').replaceAll("\"", '');

    var doc = await rootBundle.loadString('pubspec.yaml');

    var originVersion = loadYaml(doc)['version'].toString().split('+')[0];

    Timer(Duration(milliseconds: 1500), () {
      if (remoteLatestVersion == originVersion) {
        // navigatior redirect
        // context.go('/');
      } else {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/maplespy_icon.png'),
            ],
          ),
        ),
      ),
    );
  }
}
