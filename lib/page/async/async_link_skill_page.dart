import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/link_skill_page.dart';
import 'package:maplespy/provider/skill_link_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncLinkSkillPage extends ConsumerWidget {
  const AsyncLinkSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLinkSkill = ref.watch(asyncSkillLinkProvider);

    return switch (asyncLinkSkill) {
      AsyncData() => LinkSkillPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.skillPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
