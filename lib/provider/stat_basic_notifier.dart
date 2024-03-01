import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/main_stat_basic_model.dart';
import 'package:maplespy/model/stat/stat_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncStatBasicProvider =
    AsyncNotifierProvider<StatBasicNotifier, void>(StatBasicNotifier.new);

class StatBasicNotifier extends AsyncNotifier<void> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  final basicStatProvider = StateProvider(
    (ref) => Stat(),
  );

  Future<void> _fetchBasic() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**-----basic stat */
    Response basicResponse;
    Stat basicStat;
    try {
      basicResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_STAT_PATH'));
      basicStat = Stat.fromJson(basicResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    ref.read(basicStatProvider.notifier).update((state) => basicStat);
  }

  @override
  Future<void> build() {
    throw Error();
  }

  Future<void> getNewBasicStat() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchBasic());
  }

  bool isEqualCharacterClass(String stat) {
    return StaticSwitchConfig.switchClassMainStat(
            className: ref.read(basicStatProvider).characterClass!) ==
        stat;
  }

  String findStatValue(String statName) {
    return ref
            .read(basicStatProvider)
            .finalStat!
            .singleWhere((element) => element.statName == statName,
                orElse: () => FinalStat())
            .statValue ??
        '';
  }

  String getStatValue(String stat) {
    return switch (stat) {
      '스탯 공격력\n' =>
        '${findStatValue('최소 스탯공격력')}\n~ ${findStatValue('최대 스탯공격력')}',
      '재사용 대기시간 감소' =>
        '${findStatValue('재사용 대기시간 감소 (초)')} / ${findStatValue('재사용 대기시간 감소 (%)')}',
      _ => findStatValue(stat),
    };
  }
}
