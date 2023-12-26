// import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/character/basic_model.dart';
import 'package:maple_app/model/character/dojang_model.dart';
import 'package:maple_app/model/character/popularity_model.dart';
import 'package:maple_app/model/character/propensity_model.dart';
import 'package:maple_app/model/main_character_model.dart';

// final characterProvider =
//     AutoDisposeAsyncNotifierProvider<CharacterNotifier, MainCharacter>(
//         CharacterNotifier.new);

// class CharacterNotifier extends AutoDisposeAsyncNotifier<MainCharacter> {
//   @override
//   FutureOr<MainCharacter> build() async {
//     return MainCharacter(
//       ocid: "",
//       basic: Basic(),
//       dojang: Dojang(),
//       popularity: Popularity(),
//       propensity: Propensity(),
//     );
//   }
// }

final characterProvider =
    NotifierProvider<CharacterNotifier, MainCharacter>(CharacterNotifier.new);

class CharacterNotifier extends Notifier<MainCharacter> {
  @override
  MainCharacter build() {
    return MainCharacter(
      ocid: "",
      basic: Basic(),
      dojang: Dojang(),
      popularity: Popularity(),
      propensity: Propensity(),
    );
  }

  void addOcid(final ocidData) {
    state = state.copyWith(ocid: ocidData);
  }

  void addBasic(final basicData) {
    state = state.copyWith(basic: Basic.fromJson(basicData));
  }

  void addPopularity(final popularityData) {
    state = state.copyWith(popularity: Popularity.fromJson(popularityData));
  }
}
