import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';

class MainErrorPage extends ConsumerWidget {
  const MainErrorPage({super.key, required this.message});

  final message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text(
        message,
        style: TextStyle(fontSize: FontConfig.commonSize),
      ),
    );
  }
}
