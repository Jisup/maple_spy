import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/skill/hexa_matrix_model.dart';
import 'package:maplespy/model/skill/skill_info_model.dart';
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
  final hexaDetailProvider = StateProvider(
    (ref) => <String, String>{},
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

    /**-----hexa matrix core icon*/
    // 솔 야누스에 새벽인지 황혼인지 잇으면 hexaSkillId에 추가하기
    Map<String, String> hexaDetail = HashMap();
    if (hexaMatrix.characterHexaCoreEquipment != null) {
      for (var i = 0; i < hexaMatrix.characterHexaCoreEquipment!.length; i++) {
        CharacterHexaCoreEquipment hexaCore =
            hexaMatrix.characterHexaCoreEquipment![i];

        if (hexaCore.hexaCoreName == '솔 야누스') {
          if (hexaSkill.characterSkill
                  ?.singleWhere((element) => element.skillName == '솔 야누스 : 새벽',
                      orElse: () => CharacterSkill())
                  .skillName !=
              null) {
            // 솔 야누스 새벽 추가
            hexaMatrix.characterHexaCoreEquipment![i].linkedSkill!
                .add(LinkedSkill(hexaSkillId: '솔 야누스 : 새벽'));
          } else {
            // 솔 야누스 황혼 추가
            hexaMatrix.characterHexaCoreEquipment![i].linkedSkill!
                .add(LinkedSkill(hexaSkillId: '솔 야누스 : 황혼'));
          }
        }

        for (LinkedSkill skill in hexaCore.linkedSkill ?? []) {
          String coreIcon = hexaSkill.characterSkill
                  ?.singleWhere(
                      (element) => element.skillName == skill.hexaSkillId!)
                  .skillIcon ??
              '';
          hexaDetail[skill.hexaSkillId!] = coreIcon;
        }
      }
    }

    ref.read(hexaMatrixProvider.notifier).update((state) => hexaMatrix);
    ref.read(hexaSkillProvider.notifier).update((state) => hexaSkill);
    ref.read(hexaDetailProvider.notifier).update((state) => hexaDetail);
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
    state = await AsyncValue.guard(() async => await _fetchHexaSkill());
  }

  SkillInfo getHexaSkillInfo({required String coreName}) {
    CharacterSkill skill = ref
        .read(hexaSkillProvider)
        .characterSkill!
        .where(
          (element) => element.skillName == coreName,
        )
        .first;
    return SkillInfo(
      name: skill.skillName,
      icon: skill.skillIcon,
      level: skill.skillLevel,
      description: skill.skillDescription?.split('\n\n').first,
      subDescription: (skill.skillDescription ?? '').contains('\n\n')
          ? skill.skillDescription?.split('\n\n').last
          : null,
      effect: skill.skillEffect,
    );
  }
}
