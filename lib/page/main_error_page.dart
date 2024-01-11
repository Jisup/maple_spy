import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';

class MainErrorPage extends ConsumerWidget {
  const MainErrorPage({super.key, required this.message});

  final message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: FontConfig.commonSize),
        ),
      ),
    );
  }
}
