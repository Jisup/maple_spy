// import 'dart:async';

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/character/basic_model.dart';
import 'package:maple_app/model/character/dojang_model.dart';
import 'package:maple_app/model/character/popularity_model.dart';
import 'package:maple_app/model/character/propensity_model.dart';
import 'package:maple_app/model/main_character_model.dart';
import 'package:maple_app/util/dio_instance.dart';

final characterProvider =
    AutoDisposeAsyncNotifierProvider<_CharacterNotifier, MainCharacter>(
        _CharacterNotifier.new);

final characterNameProvider = StateProvider((_) => "");

class _CharacterNotifier extends AutoDisposeAsyncNotifier<MainCharacter> {
  Future<MainCharacter> _fetchCharacter() async {
    if (ref.watch(characterNameProvider.notifier).state == "") {
      return MainCharacter(
        ocid: "",
        basic: Basic(),
        dojang: Dojang(),
        popularity: Popularity(),
        propensity: Propensity(),
      );
    }

    final characterName = ref.watch(characterNameProvider.notifier).state;

    final dioInstance = DioInstance();
    dioInstance.setQueryParameters({'character_name': characterName});

    Response response = await dioInstance.dio.get('/maplestory/v1/id');

    return MainCharacter(
      ocid: response.data['ocid'],
      basic: Basic(),
      dojang: Dojang(),
      popularity: Popularity(),
      propensity: Propensity(),
    );
  }

  @override
  FutureOr<MainCharacter> build() async {
    ref.watch(characterNameProvider);
    return _fetchCharacter();
  }
}

// final characterProvider =
//     NotifierProvider<CharacterNotifier, MainCharacter>(CharacterNotifier.new);

// class CharacterNotifier extends Notifier<MainCharacter> {
//   @override
//   MainCharacter build() {
//     return MainCharacter(
//       ocid: "",
//       basic: Basic(),
//       dojang: Dojang(),
//       popularity: Popularity(),
//       propensity: Propensity(),
//     );
//   }

//   void addOcid(final ocidData) {
//     state = state.copyWith(ocid: ocidData);
//   }

//   void addBasic(final basicData) {
//     state = state.copyWith(basic: Basic.fromJson(basicData));
//   }

//   void addPopularity(final popularityData) {
//     state = state.copyWith(popularity: Popularity.fromJson(popularityData));
//   }
// }
