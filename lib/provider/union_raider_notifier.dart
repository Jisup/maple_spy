import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/union/union_model.dart';
import 'package:maplespy/model/union/union_raider_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncUnionRaiderProvider = AsyncNotifierProvider(UnionRaiderNotifier.new);

class UnionRaiderNotifier extends AsyncNotifier {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );
  final unionProvider = StateProvider(
    (ref) => Union(),
  );
  final unionRaiderProvider = StateProvider(
    (ref) => UnionRaider(),
  );

  Future<void> _fetchUnionRaider() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);

    dioInstance.dio.options.queryParameters = {'ocid': ocid};
    /**-----basic */
    Response unionResponse;
    Union union;
    try {
      unionResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_UNION_PATH'));
      union = Union.fromJson(unionResponse.data);
    } on DioException {
      throw Error();
    }
    /**-----raider */
    Response unionRadierResponse;
    UnionRaider unionRaider;
    try {
      unionRadierResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_UNION_RAIDER_PATH'));
      unionRaider = UnionRaider.fromJson(unionRadierResponse.data);
    } on DioException {
      throw Error();
    }

    ref.read(unionProvider.notifier).update((state) => union);
    ref.read(unionRaiderProvider.notifier).update((state) => unionRaider);
  }

  @override
  void build() {}

  Future<void> getNewUnion() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _fetchUnionRaider();
    });
  }
}
