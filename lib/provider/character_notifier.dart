import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/character/basic_model.dart';
import 'package:maplespy/model/character/dojang_model.dart';
import 'package:maplespy/model/character/popularity_model.dart';
import 'package:maplespy/model/character/propensity_model.dart';
import 'package:maplespy/model/main_character_model.dart';
import 'package:maplespy/model/stat/stat_model.dart';
import 'package:maplespy/model/union/union_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncCharacterProvider =
    AsyncNotifierProvider<CharacterNotifier, MainCharacter>(
        CharacterNotifier.new);

class CharacterNotifier extends AsyncNotifier<MainCharacter> {
  Future<MainCharacter> _fetchCharacter() async {
    final dioInstance = DioInstance();
    final yesterday = DayInstance().yesterday;

    final ocid = ref.read(ocidProvider);

    dioInstance.dio.options.queryParameters = {'ocid': ocid, 'date': yesterday};
    /**-----basic*/
    Response basicResponse;
    Basic basic;
    try {
      basicResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_BASIC_PATH'));
      basic = Basic.fromJson(basicResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    /**-----dojang*/
    Response dojangResponse;
    Dojang dojang;
    try {
      dojangResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_DOJANG_PATH'));
      dojang = Dojang.fromJson(dojangResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    /**-----popularity*/
    // Response popularityResponse;
    // Popularity popularity;
    // try {
    //   popularityResponse =
    //       await dioInstance.dio.get(dotenv.get('MAPLESTORY_POPULARITY_PATH'));
    //   popularity = Popularity.fromJson(popularityResponse.data);
    // } on DioException catch (e) {
    //   throw Error();
    // }
    /**-----propensity*/
    // Response propensityResponse;
    // Propensity propensity;
    // try {
    //   propensityResponse =
    //       await dioInstance.dio.get(dotenv.get('MAPLESTORY_PROPENSITY_PATH'));
    //   propensity = Propensity.fromJson(propensityResponse.data);
    // } on DioException catch (e) {
    //   throw Error();
    // }
    /**-----stat */
    Response statResponse;
    Stat stat;
    try {
      statResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_STAT_PATH'));
      stat = Stat.fromJson(statResponse.data);
    } on DioException catch (e) {
      throw Error();
    }
    /**-----union */
    Response unionResponse;
    Union union;
    try {
      unionResponse =
          await dioInstance.dio.get(dotenv.get('MAPLESTORY_UNION_PATH'));
      union = Union.fromJson(unionResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    return MainCharacter(
      basic: basic,
      dojang: dojang,
      // popularity: popularity,
      // propensity: propensity,
      stat: stat,
      union: union,
    );
  }

  @override
  FutureOr<MainCharacter> build() {
    return _fetchCharacter();
  }
}
