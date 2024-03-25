import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingSpinner extends ConsumerWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.25),
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.25),
      ),
    );
  }
}
