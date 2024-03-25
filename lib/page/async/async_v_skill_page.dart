import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/v_skill_page.dart';
import 'package:maplespy/provider/skill_v_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncVSkillPage extends ConsumerWidget {
  const AsyncVSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVSkill = ref.watch(asyncSkillVProvider);

    return switch (asyncVSkill) {
      AsyncData() => const VSkillPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.skillPageRequestError),
      _ => const LoadingSpinner(),
    };
  }
}
