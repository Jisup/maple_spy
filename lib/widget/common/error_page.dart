import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key, required this.message});

  final message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text('request error'),
    );
  }
}
