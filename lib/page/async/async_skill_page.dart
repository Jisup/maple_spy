import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/skill_page.dart';
import 'package:maplespy/provider/skill_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncSkillPage extends ConsumerWidget {
  const AsyncSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSkill = ref.watch(asyncSkillProvider);

    return switch (asyncSkill) {
      AsyncData(:final value) => SkillPage(
          mainSkill: value,
        ),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.skillPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
