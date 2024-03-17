import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final skillControllerProvider = NotifierProvider(SkillController.new);

class SkillController extends Notifier {
  late ScrollController scrollController;

  @override
  build() {}

  void changeSkillToggle() async {
    bool skillToggle = ref.read(skillToggleProvider);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('skillToggle', !skillToggle);
    ref.read(skillToggleProvider.notifier).update((state) => !skillToggle);
  }
}
