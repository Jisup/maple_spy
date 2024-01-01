import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';

class ItemDetailImagePage extends ConsumerWidget {
  const ItemDetailImagePage(
      {super.key, required this.imageUrl, required this.grade});

  final String imageUrl;
  final String grade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.all(DimenConfig.commonDimen),
        decoration: BoxDecoration(
            border: Border.all(
                color: StaticSwitchConfig.potentialGradeDetailColor[grade]!)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
