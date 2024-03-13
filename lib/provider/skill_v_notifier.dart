import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncSkillVProvider = AsyncNotifierProvider(SkillVNotifier.new);

class SkillVNotifier extends AsyncNotifier<void> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  final vMatrixProvider = StateProvider(
    (ref) => VMatrix(),
  );
  final vSkillCoreProvider = StateProvider(
    (ref) => [],
  );
  final vEnhanceCoreProvider = StateProvider(
    (ref) => [],
  );
  final vEtcCoreProvider = StateProvider(
    (ref) => [],
  );
  final vDetailProvider = StateProvider(
    (ref) => <String, VDetail>{},
  );

  Future<void> _fetchVSkill() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**-----v matrix */
    Response vMatrixResponse;
    VMatrix vMatrix;
    try {
      vMatrixResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_VMATRIX_PATH'));
      vMatrix = VMatrix.fromJson(vMatrixResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    /**-----v skill */
    dioInstance.dio.options.queryParameters = {
      'ocid': ocid,
      'date': yesterday,
      'character_skill_grade': 5
    };
    Response vSkillResponse;
    Skill vSkill;
    try {
      vSkillResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_SKILL_PATH'));
      vSkill = Skill.fromJson(vSkillResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    /**-----v matrix slot total level*/
    Map<String, VDetail> vDetail = HashMap();
    for (CharacterVCoreEquipment vCore
        in vMatrix.characterVCoreEquipment ?? []) {
      if (vCore.vCoreSkill1 != null) {
        vDetail.containsKey(vCore.vCoreSkill1)
            ? vDetail.update(vCore.vCoreSkill1!, (value) {
                return VDetail(
                  slotLevel: value.slotLevel + vCore.slotLevel!,
                  skillType: value.skillType,
                );
              })
            : vDetail.addAll({
                vCore.vCoreSkill1!: VDetail(
                  slotLevel: vCore.slotLevel!,
                  skillType: vCore.vCoreType!,
                ),
              });
      }
      if (vCore.vCoreSkill2 != null) {
        vDetail.containsKey(vCore.vCoreSkill2)
            ? vDetail.update(vCore.vCoreSkill2!, (value) {
                return VDetail(
                  slotLevel: value.slotLevel + vCore.slotLevel!,
                  skillType: value.skillType,
                );
              })
            : vDetail.addAll({
                vCore.vCoreSkill2!: VDetail(
                  slotLevel: vCore.slotLevel!,
                  skillType: vCore.vCoreType!,
                ),
              });
      }
      if (vCore.vCoreSkill3 != null) {
        vDetail.containsKey(vCore.vCoreSkill3)
            ? vDetail.update(vCore.vCoreSkill3!, (value) {
                return VDetail(
                  slotLevel: value.slotLevel + vCore.slotLevel!,
                  skillType: value.skillType,
                );
              })
            : vDetail.addAll({
                vCore.vCoreSkill3!: VDetail(
                  slotLevel: vCore.slotLevel!,
                  skillType: vCore.vCoreType!,
                ),
              });
      }

      ref.read(vMatrixProvider.notifier).update((state) => vMatrix);
      if (vSkill.characterSkill != null && vSkill.characterSkill!.isNotEmpty) {
        ref.read(vSkillCoreProvider.notifier).update((state) =>
            vSkill.characterSkill
                ?.where((element) =>
                    vDetail[element.skillName]?.skillType == '스킬코어')
                .toList() ??
            []);
        ref.read(vEnhanceCoreProvider.notifier).update((state) =>
            vSkill.characterSkill
                ?.where((element) =>
                    vDetail[element.skillName]?.skillType == '강화코어')
                .toList() ??
            []);
        ref.read(vEtcCoreProvider.notifier).update((state) =>
            vSkill.characterSkill
                ?.where(
                    (element) => vDetail[element.skillName]?.skillType == null)
                .toList() ??
            []);
      }
      ref.read(vDetailProvider.notifier).update((state) => vDetail);
    }
  }

  @override
  Future<void> build() {
    throw Error();
  }

  Future<void> getNewVSkill() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchVSkill());
  }
}
