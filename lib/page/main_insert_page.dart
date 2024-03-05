import 'dart:async';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaml/yaml.dart';

class MainInsertPage extends ConsumerStatefulWidget {
  const MainInsertPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainInsertPageState();
}

class _MainInsertPageState extends ConsumerState<MainInsertPage> {
  @override
  void initState() {
    super.initState();

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
      // if (remoteLatestVersion == originVersion) {
      if (true) {
        // navigatior redirect
        context.go('/');
      } else {
        // store redirect
        context.go('/update', extra: {
          'oldVersion': originVersion,
          'newVersion': remoteLatestVersion,
        });
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
              Center(child: Image.asset('assets/maplespy_icon.png')),
            ],
          ),
        ),
      ),
    );
  }
}
