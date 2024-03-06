import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/union/union_ranking_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncUnionMainCharacterProvider =
    AsyncNotifierProvider(UnionMainCharacterNotifier.new);

class UnionMainCharacterNotifier extends AsyncNotifier {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );
  final unionRankingProvider = StateProvider(
    (ref) => UnionRanking(),
  );

  Future<void> _fetchUnionCharacter() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    final world_name = ref.read(characterWorldProvider);

    dioInstance.dio.options.queryParameters = {
      'ocid': ocid,
      'date': yesterday,
      'world_name': world_name,
    };
    /**-----ranking */
    Response unionRankingResponse;
    UnionRanking unionRanking;
    try {
      unionRankingResponse = await dioInstance.dio
          .get(dotenv.get('MAPLESTORY_UNION_RANKING_PATH'));
      unionRanking = UnionRanking.fromJson(unionRankingResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    ref.read(unionRankingProvider.notifier).update((state) => unionRanking);
  }

  @override
  void build() {}

  Future<void> getNewUnionMainCharacter() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchUnionCharacter());
  }
}
