import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/controller/main_controller.dart';
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

    getUserSetting();
    checkApplicationVersion();
  }

  void getUserSetting() {
    ref.read(mainControllerProvider.notifier).getUserSetting();
  }

  void checkApplicationVersion() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(milliseconds: 2000),
      // minimumFetchInterval: Duration(milliseconds: 1),
      minimumFetchInterval: Duration(hours: 24),
    ));
    remoteConfig.setDefaults({
      'latest_version': '0.0.0',
    });
    await remoteConfig.fetchAndActivate();

    var remoteLatestVersion = remoteConfig.getString('latest_version');

    // print(remoteLatestVersion);

    var doc = await rootBundle.loadString('pubspec.yaml');

    var originVersion = loadYaml(doc)['version'].toString().split('+')[0];

    var latest =
        remoteLatestVersion.split('.').map((e) => int.parse(e)).toList();
    var origin = originVersion.split('.').map((e) => int.parse(e)).toList();

    Timer(Duration(milliseconds: 2000), () {
      if (latest[0] <= origin[0] &&
          latest[1] <= origin[1] &&
          latest[2] <= origin[2]) {
        // if (true) {
        // navigatior redirect
        getUserSetting();
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
