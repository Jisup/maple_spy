import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:maple_app/model/character/basic_model.dart';
import 'package:maple_app/model/character/dojang_model.dart';
import 'package:maple_app/model/character/popularity_model.dart';
import 'package:maple_app/model/character/propensity_model.dart';
import 'package:maple_app/model/main_character_model.dart';
import 'package:maple_app/util/dio_instance.dart';

final asyncCharacterProvider =
    AutoDisposeAsyncNotifierProvider<CharacterNotifier, MainCharacter>(
        CharacterNotifier.new);

final characterNameProvider = StateProvider((_) => "");

final ocidProvider = StateProvider((_) => "");

class CharacterNotifier extends AutoDisposeAsyncNotifier<MainCharacter> {
  Future<MainCharacter> _fetchCharacter() async {
    final dioInstance = DioInstance();

    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final yesterday =
        formatter.format(DateTime.now().subtract(const Duration(hours: 25)));

    final characterName = ref.watch(characterNameProvider.notifier).state;
    dioInstance.dio.options.queryParameters = {'character_name': characterName};

    /**----- get ocid ----- */
    Response ocidResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_OCID_PATH'));
    String ocid = ocidResponse.data['ocid'];

    ref.watch(ocidProvider.notifier).update((state) => ocid);

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};

    /**----- get basic ----- */
    Response basicResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_BASIC_PATH'));
    Basic basic = Basic.fromJson(basicResponse.data);

    /**----- get dojang ----- */
    Response dojangResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_DOJANG_PATH'));
    Dojang dojang = Dojang.fromJson(dojangResponse.data);

    /**----- get popularity ----- */
    Response popularityResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_POPULARITY_PATH'));
    Popularity popularity = Popularity.fromJson(popularityResponse.data);

    /**----- get propensity ----- */
    Response propensityResponse =
        await dioInstance.dio.get(dotenv.get('MAPLESTORY_PROPENSITY_PATH'));
    Propensity propensity = Propensity.fromJson(propensityResponse.data);

    return MainCharacter(
      ocid: ocid,
      basic: basic,
      dojang: dojang,
      popularity: popularity,
      propensity: propensity,
    );
  }

  @override
  FutureOr<MainCharacter> build() async {
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
