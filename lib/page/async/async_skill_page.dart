import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/page/skill/skill_detail_page.dart';
import 'package:maple_app/provider/skill_notifier.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';

class AsyncSkillPage extends ConsumerWidget {
  const AsyncSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSkill = ref.watch(asyncSkillProvider);

    return switch (asyncSkill) {
      AsyncData(:final value) => SkillDetailPage(mainSkill: value),
      AsyncError(:final error) =>
        MainErrorPage(message: 'skill request\nhas something error'),
      _ => LoadingSpinner(),
    };
  }
}
