import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/main_skill_model.dart';
import 'package:maple_app/model/skill/hexamatrix_skill_model.dart';
import 'package:maple_app/model/skill/link_skill_model.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/model/skill/vmatrix_skill_model.dart';

final skillProvider =
    AutoDisposeAsyncNotifierProvider<SkillNotifier, MainSkill>(
        SkillNotifier.new);

class SkillNotifier extends AutoDisposeAsyncNotifier<MainSkill> {
  @override
  FutureOr<MainSkill> build() {
    return MainSkill(
      skill: Skill(),
      link: LinkSkill(),
      vmatrix: VmatrixSkill(),
      hexamatrix: HexamatrixSkill(),
    );
  }
}
