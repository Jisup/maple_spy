import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/skill/link_skill_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncSkillLinkProvider = AsyncNotifierProvider(SkillLinkNotifier.new);

class SkillLinkNotifier extends AsyncNotifier<void> {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );

  final linkSkillProvider = StateProvider(
    (ref) => LinkSkill(),
  );

  Future<void> _fetchLinkSkill() async {
    final dioInstance = DioInstance();

    final ocid = ref.read(ocidProvider);

    dioInstance.dio.options.queryParameters = {'ocid': ocid};

    /**-----link skill */
    Response linkSkillResponse;
    LinkSkill linkSkill;
    try {
      linkSkillResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_LINKSKILL_PATH'));
      linkSkill = LinkSkill.fromJson(linkSkillResponse.data);
    } on DioException {
      throw Error();
    }

    ref.read(linkSkillProvider.notifier).update((state) => linkSkill);
  }

  @override
  Future<void> build() {
    throw Error();
  }

  Future<void> getNewLinkSkill() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchLinkSkill());
  }
}
