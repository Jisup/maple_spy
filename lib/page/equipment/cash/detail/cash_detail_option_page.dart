import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';

class CashDetailOptionPage extends ConsumerWidget {
  const CashDetailOptionPage({
    super.key,
    required this.part,
    this.options,
    this.label,
  });

  final String part;
  final List<CashItemOption>? options;
  final bool? label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('장비분류 : ${part}', style: const TextStyle(color: Colors.white)),
        label ?? false ? const DashedDividerWidget() : const SizedBox.shrink(),
        options != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options!.map((option) {
                  return label ?? false
                      ? Text(
                          '${option.optionType} : +${option.optionValue}',
                          style: const TextStyle(
                              color: CashColor.masterLabelOption),
                        )
                      : Text.rich(TextSpan(children: [
                          TextSpan(
                              text:
                                  '${option.optionType} : +${option.optionValue}',
                              style: const TextStyle(
                                  color: ItemColor.totalOptionText)),
                          const TextSpan(
                              text: ' (0 ',
                              style: TextStyle(color: Colors.white)),
                          TextSpan(
                              text: '+${option.optionValue}',
                              style: const TextStyle(
                                  color: ItemColor.etcOptionText)),
                          const TextSpan(
                              text: ')', style: TextStyle(color: Colors.white)),
                        ]));
                }).toList(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
