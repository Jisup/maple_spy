import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/hexa_skill_page.dart';
import 'package:maplespy/provider/skill_hexa_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncHexaSkillPage extends ConsumerWidget {
  const AsyncHexaSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHexaSkill = ref.watch(asyncSkillHexaProvider);

    return switch (asyncHexaSkill) {
      AsyncData() => HexaSkillPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.skillPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
