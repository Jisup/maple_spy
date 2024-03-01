import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/provider/stat_basic_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class BasicDetailMainInfoPage extends ConsumerWidget {
  const BasicDetailMainInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBasicNotifier = ref.read(asyncStatBasicProvider.notifier);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: CustomTextWidget(
                  text: '전투력',
                  size: FontConfig.middleSize,
                  color: Colors.yellow,
                  subColor: Colors.black87,
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CustomTextWidget(
                    text: asyncBasicNotifier.findStatValue('전투력'),
                    size: FontConfig.middleSize,
                    color: Colors.yellow,
                    subColor: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        Semantics(
          label: '구분 선',
          readOnly: true,
          child: Divider(
            color: StatColor.divider,
            height: DimenConfig.commonDimen * 2,
            thickness: 2,
            indent: DimenConfig.commonDimen * 2,
            endIndent: DimenConfig.commonDimen * 2,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: DimenConfig.commonDimen,
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Wrap(
            children: StaticListConfig.statMainList.map((stat) {
              var even = StaticListConfig.statMainList.indexOf(stat) % 2 == 0;
              return FractionallySizedBox(
                widthFactor: 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: !even
                          ? EdgeInsets.only(left: DimenConfig.commonDimen)
                          : null,
                      child: CustomTextWidget(
                        text: stat,
                        size: FontConfig.commonSize,
                        color: asyncBasicNotifier.isEqualCharacterClass(stat)
                            ? Colors.yellow
                            : Colors.white,
                        subColor: Colors.black26,
                      ),
                    ),
                    Container(
                      margin: even
                          ? EdgeInsets.only(right: DimenConfig.commonDimen)
                          : null,
                      child: Text(
                        asyncBasicNotifier.findStatValue(stat),
                        style: TextStyle(
                            color:
                                asyncBasicNotifier.isEqualCharacterClass(stat)
                                    ? Colors.yellow
                                    : Colors.white,
                            fontSize: FontConfig.commonSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
