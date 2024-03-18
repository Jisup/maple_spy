import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPaintTextWidget extends ConsumerWidget {
  const CustomPaintTextWidget({
    super.key,
    required this.content,
    required this.fixed,
    required this.color,
  });

  final String content;
  final String fixed;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final head = content.split(fixed).first;
    final tail = content.split(fixed).last;
    print(head);

    return head == tail || head == '재사용 대기시간 '
        ? Text(
            content,
            style: TextStyle(color: Colors.white),
          )
        : Text.rich(
            TextSpan(children: [
              TextSpan(text: head, style: TextStyle(color: color)),
              TextSpan(text: ' : ', style: TextStyle(color: Colors.white)),
              TextSpan(text: tail, style: TextStyle(color: Colors.white)),
            ]),
          );
  }
}
