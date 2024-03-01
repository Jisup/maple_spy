import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/stat/ability_stat_model.dart';
import 'package:maplespy/model/stat/hyper_stat_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncStatAbilityHyperProvider =
    AsyncNotifierProvider<StatAbilityHyperNotifier, void>(
        StatAbilityHyperNotifier.new);

class StatAbilityHyperNotifier extends AsyncNotifier<void> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  final abilityStatProvider = StateProvider(
    (ref) => AbilityStat(),
  );
  final hyperStatProvider = StateProvider(
    (ref) => HyperStat(),
  );

  Future<void> _fetchAbilityHyper() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**-----ability stat */
    Response abilityResponse;
    AbilityStat abilityStat;
    try {
      abilityResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_ABILITY_PATH'));
      abilityStat = AbilityStat.fromJson(abilityResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    /**-----hyper stat */
    Response hyperResponse;
    HyperStat hyperStat;
    try {
      hyperResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_HYPERSTAT_PATH'));
      hyperStat = HyperStat.fromJson(hyperResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    ref.read(abilityStatProvider.notifier).update((state) => abilityStat);
    ref.read(hyperStatProvider.notifier).update((state) => hyperStat);
  }

  @override
  Future<void> build() {
    throw Error();
  }

  Future<void> getNewAbilityHyperStat() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchAbilityHyper());
  }

  AbilityPreset? abilityStatPresetInfo(String preset) {
    switch (preset) {
      case 'preset1':
        return ref.read(abilityStatProvider).abilityPreset1;
      case 'preset2':
        return ref.read(abilityStatProvider).abilityPreset2;
      case 'preset3':
        return ref.read(abilityStatProvider).abilityPreset3;
      default:
        return null;
    }
  }

  List<HyperStatPreset>? hyperStatPresetInfo(String preset) {
    switch (preset) {
      case 'preset1':
        return ref.read(hyperStatProvider).hyperStatPreset1;
      case 'preset2':
        return ref.read(hyperStatProvider).hyperStatPreset2;
      case 'preset3':
        return ref.read(hyperStatProvider).hyperStatPreset3;
      default:
        return [];
    }
  }
}
