import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/union/union_artifact_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncUnionArtifactProvider =
    AsyncNotifierProvider(UnionArtifactNotifier.new);

class UnionArtifactNotifier extends AsyncNotifier {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );
  final unionArtifactProvider = StateProvider(
    (ref) => UnionArtifact(),
  );

  Future<void> _fetchUnionArtifact() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};
    /**-----artifact */
    Response unionArtifactResponse;
    UnionArtifact unionArtifact;
    try {
      unionArtifactResponse = await dioInstance.dio
          .get(dotenv.get('MAPLESTORY_UNION_ARTIFACT_PATH'));
      unionArtifact = UnionArtifact.fromJson(unionArtifactResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    ref.read(unionArtifactProvider.notifier).update((state) => unionArtifact);
  }

  @override
  void build() {}

  Future<void> getNewUnionArtifact() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchUnionArtifact());
  }
}
