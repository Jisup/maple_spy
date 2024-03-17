import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/android_item_model.dart';

class AndroidItemInfo extends ConsumerWidget {
  const AndroidItemInfo({super.key, required this.name, required this.item});

  final String name;
  final AndroidItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return item?.androidName != null
        ? GestureDetector(
            onTap: () =>
                context.push('/equipment/androidItem/detail', extra: item),
            child: Semantics(
              label:
                  '${name} 아이템 칸, ${item != null ? '${item!.androidName}' : '비어있음'}',
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
                          offset: Offset(-3, -3),
                          color: Colors.white,
                          inset: true),
                      BoxShadow(
                          blurRadius: RadiusConfig.subRadius,
                          offset: Offset(3, 3),
                          color: Colors.black87,
                          inset: true),
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
                    /**-----item icon */
                    item?.androidIcon != null
                        ? SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image(
                              image: NetworkImage(item!.androidIcon!),
                              fit: BoxFit.contain,
                              semanticLabel: '${item!.androidName!} 이미지',
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
