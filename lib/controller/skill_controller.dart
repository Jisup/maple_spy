import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skillControllerProvider = NotifierProvider(SkillController.new);

class SkillController extends Notifier {
  late ScrollController scrollController;

  @override
  build() {}
}
