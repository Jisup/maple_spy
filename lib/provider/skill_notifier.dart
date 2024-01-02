import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/main_skill_model.dart';
import 'package:maple_app/model/skill/hexamatrix_skill_model.dart';
import 'package:maple_app/model/skill/link_skill_model.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/model/skill/vmatrix_skill_model.dart';
import 'package:maple_app/provider/character_notifier.dart';
import 'package:maple_app/util/day_instance.dart';
import 'package:maple_app/util/dio_instance.dart';

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
    Response linkSkillResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_LINKSKILL_PATH'));
    LinkSkill linkSkill = LinkSkill.fromJson(linkSkillResponse.data);
    /**-----v matrix skill */
    Response vmatrixResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_VMATRIX_PATH'));
    VmatrixSkill vmatrixSkill = VmatrixSkill.fromJson(vmatrixResponse.data);
    /**-----hexa matrix skill */
    Response hexamatrixResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_HEXAMATRIX_PATH'));
    HexamatrixSkill hexamatrixSkill =
        HexamatrixSkill.fromJson(hexamatrixResponse.data);

    /**-----v skill */
    dioInstance.dio.options.queryParameters = {
      'ocid': ocid,
      'date': yesterday,
      'character_skill_grade': 5
    };
    Response vSkillResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_SKILL_PATH'));
    Skill vSkill = Skill.fromJson(vSkillResponse.data);

    /**-----hexa skill */
    dioInstance.dio.options.queryParameters = {
      'ocid': ocid,
      'date': yesterday,
      'character_skill_grade': 6
    };
    Response hexaSkillResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_SKILL_PATH'));
    Skill hexaSkill = Skill.fromJson(hexaSkillResponse.data);

    return MainSkill(
      skill: Skill(),
      // skill: skill,
      link: linkSkill,
      vSkill: vSkill,
      vmatrix: vmatrixSkill,
      hexaSkill: hexaSkill,
      hexamatrix: hexamatrixSkill,
    );
  }

  @override
  Future<MainSkill> build() {
    return _fetchSkill();
  }
}
