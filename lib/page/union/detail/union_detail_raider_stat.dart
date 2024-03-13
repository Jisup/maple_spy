import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/common_provider.dart';

class UnionDetailRaiderStat extends ConsumerWidget {
  const UnionDetailRaiderStat({
    super.key,
    required this.statList,
  });

  final List<String> statList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen * 2,
        right: DimenConfig.commonDimen * 2,
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen,
      ),
      child: Wrap(
        runSpacing: DimenConfig.minDimen,
        children: statList.isNotEmpty
            ? statList
                .map((stat) => Row(
                      children: [
                        Text(
                          '●',
                          style: TextStyle(fontSize: FontConfig.minSize),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(left: DimenConfig.commonDimen),
                            child: Text(
                              stat,
                              style: TextStyle(fontSize: FontConfig.commonSize),
                            )),
                      ],
                    ))
                .toList()
            : [
                MainErrorPage(
                    message: ref.watch(unionRaiderSelectTabProvider) ==
                            'occupied'
                        ? ErrorMessageConfig.unionRaiderPageWholeVariableError
                        : ErrorMessageConfig.unionRaiderPageEachVariableError)
              ],
      ),
    );
  }
}
