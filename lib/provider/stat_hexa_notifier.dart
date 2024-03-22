import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/stat/hexa_matrix_stat_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncStatHexaProvider =
    AsyncNotifierProvider<StatHexaNotifier, void>(StatHexaNotifier.new);

class StatHexaNotifier extends AsyncNotifier<void> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  final hexaMatrixStatProvider = StateProvider(
    (ref) => HexaMatrixStat(),
  );

  Future<void> _fetchHexa() async {
    DioInstance dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);

    dioInstance.dio.options.queryParameters = {'ocid': ocid};

    /**-----hexa matrix stat */
    Response hexaMatrixResponse;
    HexaMatrixStat hexaMatrixStat;
    try {
      hexaMatrixResponse = await dioInstance.dio
          .get(dotenv.get('MAPLESTORY_HEXAMATRIXSTAT_PATH'));
      hexaMatrixStat = HexaMatrixStat.fromJson(hexaMatrixResponse.data);
    } on DioException {
      throw Error();
    }

    ref.read(hexaMatrixStatProvider.notifier).update((state) => hexaMatrixStat);
  }

  @override
  Future<void> build() {
    throw Error();
  }

  Future<void> getNewHexaStat() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchHexa());
  }
}
