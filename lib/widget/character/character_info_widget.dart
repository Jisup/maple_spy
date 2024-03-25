import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/nav_controller.dart';
import 'package:stroke_text/stroke_text.dart';

class CharacterInfoWidget extends ConsumerWidget {
  const CharacterInfoWidget(
      {super.key,
      this.title,
      required this.value,
      this.detailPath,
      this.pathType,
      required this.type});

  final String? title;
  final String value;
  final String? detailPath;
  final String? pathType;
  final bool type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.all(DimenConfig.subDimen),
      child: Row(
        children: [
          title != null
              ? Expanded(
                  child: GestureDetector(
                    onTap: detailPath != null
                        ? () => switch (pathType) {
                              '유니온' => ref
                                  .read(navControllerProvider.notifier)
                                  .onClickNavTab(
                                      tab: pathType!, path: detailPath!),
                              _ => () {},
                            }
                        : null,
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      padding: EdgeInsets.all(DimenConfig.commonDimen),
                      decoration: BoxDecoration(
                        color: type
                            ? colorScheme.primary
                            : colorScheme.onSecondary,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(RadiusConfig.maxRadius)),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: DimenConfig.commonDimen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StrokeText(
                              text: title!,
                              textStyle: TextStyle(
                                height: 1,
                                color: Colors.white,
                                fontSize: FontConfig.middleDownSize,
                                fontWeight: FontWeight.bold,
                                letterSpacing: SpacingConfig.commonSpacing,
                                overflow: TextOverflow.ellipsis,
                              ),
                              strokeColor: colorScheme.primary,
                              strokeWidth: StrokeConfig.commonWidth,
                            ),
                            detailPath != null
                                ? Icon(
                                    Icons.open_in_new,
                                    size: FontConfig.middleDownSize,
                                    color: type ? Colors.white : Colors.black,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(title != null
                  ? DimenConfig.commonDimen
                  : DimenConfig.subDimen),
              decoration: BoxDecoration(
                color: type ? colorScheme.primary : colorScheme.onSecondary,
                borderRadius: title != null
                    ? BorderRadius.horizontal(
                        right: Radius.circular(RadiusConfig.maxRadius))
                    : BorderRadius.all(Radius.circular(RadiusConfig.maxRadius)),
              ),
              child: Container(
                margin:
                    title == null ? EdgeInsets.all(DimenConfig.minDimen) : null,
                child: Text(
                  value,
                  textAlign: title == null ? TextAlign.center : null,
                  style: TextStyle(
                    height: 1,
                    color: type ? Colors.white : Colors.black,
                    fontSize: title != null
                        ? FontConfig.middleDownSize
                        : FontConfig.commonSize,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
