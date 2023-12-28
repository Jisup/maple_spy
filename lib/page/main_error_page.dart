import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainErrorPage extends ConsumerWidget {
  const MainErrorPage({super.key, required this.message});

  final message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text('something`s error'),
    );
  }
}
