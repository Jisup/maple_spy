import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/skill/hexa_matrix_model.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncSkillHexaProvider = AsyncNotifierProvider(SkillHexaNotifier.new);

class SkillHexaNotifier extends AsyncNotifier<void> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  final hexaMatrixProvider = StateProvider(
    (ref) => HexaMatrix(),
  );
  final hexaSkillProvider = StateProvider(
    (ref) => Skill(),
  );

  Future<void> _fetchHexaSkill() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**-----hexa matrix */
    Response hexaMatrixResponse;
    HexaMatrix hexaMatrix;
    try {
      hexaMatrixResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_HEXAMATRIX_PATH'));
      hexaMatrix = HexaMatrix.fromJson(hexaMatrixResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    /**-----hexa skill */
    dioInstance.dio.options.queryParameters = {
      'ocid': ocid,
      'date': yesterday,
      'character_skill_grade': 6
    };
    Response hexaSkillResponse;
    Skill hexaSkill;
    try {
      hexaSkillResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_SKILL_PATH'));
      hexaSkill = Skill.fromJson(hexaSkillResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    ref.read(hexaMatrixProvider.notifier).update((state) => hexaMatrix);
    ref.read(hexaSkillProvider.notifier).update((state) => hexaSkill);
  }

  @override
  Future<void> build() {
    throw Error();
  }

  Future<void> getNewHexaSkill() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchHexaSkill());
  }
}
