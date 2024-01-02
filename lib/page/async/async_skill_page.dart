import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/page/skill/hexa_matrix_page.dart';
import 'package:maple_app/page/skill/link_page.dart';
import 'package:maple_app/page/skill/v_matrix_page.dart';
import 'package:maple_app/provider/skill_notifier.dart';
import 'package:maple_app/widget/common/loading_spinner.dart';

final skillSelectTabProvider = StateProvider((_) => 'hexa');

class AsyncSkillPage extends ConsumerWidget {
  const AsyncSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSkill = ref.watch(asyncSkillProvider);
    final skillTab = ref.watch(skillSelectTabProvider);

    return switch (asyncSkill) {
      AsyncData(:final value) => switch (skillTab) {
          'hexa' => HexaMatrixPage(hexamatrix: value.hexamatrix),
          'v' => VMatrixPage(vmatrix: value.vmatrix),
          'link' => LinkPage(link: value.link),
          _ => MainErrorPage(message: 'skill select tab\nhas something error'),
        },
      AsyncError(:final error) =>
        MainErrorPage(message: 'skill request\nhas something error'),
      _ => LoadingSpinner(),
    };
  }
}
