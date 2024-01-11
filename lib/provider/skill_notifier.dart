import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/main_skill_model.dart';
import 'package:maplespy/model/skill/hexa_matrix_model.dart';
import 'package:maplespy/model/skill/link_skill_model.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncSkillProvider =
    AutoDisposeAsyncNotifierProvider<SkillNotifier, MainSkill>(
        SkillNotifier.new);

class SkillNotifier extends AutoDisposeAsyncNotifier<MainSkill> {
  Future<MainSkill> _fetchSkill() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);
    final yesterday = DayInstance().yesterday;

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**-----link skill */
    Response linkSkillResponse;
    LinkSkill linkSkill;
    try {
      linkSkillResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_LINKSKILL_PATH'));
      linkSkill = LinkSkill.fromJson(linkSkillResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

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

    return MainSkill(
      skill: Skill(),
      // skill: skill,
      link: linkSkill,
      vSkill: vSkill,
      vMatrix: vMatrix,
      hexaSkill: hexaSkill,
      hexaMatrix: hexaMatrix,
    );
  }

  @override
  Future<MainSkill> build() {
    return _fetchSkill();
  }
}
