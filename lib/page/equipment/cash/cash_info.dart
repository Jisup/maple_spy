import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';

class CashInfo extends ConsumerWidget {
  const CashInfo({super.key, required this.name, required this.cashItem});

  final String name;
  final CashItemEquipment cashItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: cashItem.cashItemName != null
          ? () => context.push('/equipment/cash/detail', extra: cashItem)
          : null,
      child: Semantics(
        label: '캐시 ${name} 아이템 칸, ${cashItem.cashItemName ?? '비어있음'}',
        button: true,
        child: Container(
          margin: EdgeInsets.all(DimenConfig.minDimen),
          padding: EdgeInsets.all(DimenConfig.subDimen),
          decoration: BoxDecoration(
              color: colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
              boxShadow: [
                BoxShadow(
                    blurRadius: RadiusConfig.subRadius,
                    offset: const Offset(-3, -3),
                    color: Colors.white,
                    inset: true),
                BoxShadow(
                    blurRadius: RadiusConfig.subRadius,
                    offset: const Offset(3, 3),
                    color: Colors.black87,
                    inset: true)
              ]),
          child: Stack(
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: FontConfig.minSize,
                    letterSpacing: SpacingConfig.minSpacing,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              cashItem.cashItemIcon != null
                  ? SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image(
                        image: NetworkImage(cashItem.cashItemIcon!),
                        fit: BoxFit.contain,
                        semanticLabel: '${cashItem.cashItemName} 이미지',
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
