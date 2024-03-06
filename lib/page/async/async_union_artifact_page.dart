import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/union_artifact_page.dart';
import 'package:maplespy/provider/union_artifact_notifier.dart';
import 'package:maplespy/widget/common/loading_spinner.dart';

class AsyncUnionArtifactPage extends ConsumerWidget {
  const AsyncUnionArtifactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUnionArtifact = ref.watch(asyncUnionArtifactProvider);

    return switch (asyncUnionArtifact) {
      AsyncData() => UnionArtifactPage(),
      AsyncError() =>
        MainErrorPage(message: ErrorMessageConfig.unionPageRequestError),
      _ => LoadingSpinner(),
    };
  }
}
