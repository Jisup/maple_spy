import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/character/basic_model.dart';
import 'package:maplespy/model/character/dojang_model.dart';
import 'package:maplespy/model/character/popularity_model.dart';
import 'package:maplespy/model/character/propensity_model.dart';
import 'package:maplespy/model/firestore/character.dart';
import 'package:maplespy/model/main_character_model.dart';
import 'package:maplespy/model/stat/stat_model.dart';
import 'package:maplespy/model/union/union_model.dart';
import 'package:maplespy/model/union/union_ranking_model.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/util/day_instance.dart';
import 'package:maplespy/util/dio_instance.dart';

final asyncCharacterProvider = AsyncNotifierProvider(() {
  return CharacterNotifier();
});

class CharacterNotifier extends AsyncNotifier {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );
  final mainCharacterProvider = StateProvider(
    (ref) => MainCharacter(),
  );
  final unionMainCharacterProvider = StateProvider(
    (ref) => '',
  );

  Future<void> _fetchUnion(
      {required String oldOcid, required Basic basic}) async {
    final dioInstance = DioInstance();
    final yesterday = DayInstance().yesterday;

    final db = FirebaseFirestore.instance;
    final characterRef = db.collection('characters').withConverter(
        fromFirestore: Character.fromFirestore,
        toFirestore: (Character character, options) => character.toFirestore());

    dioInstance.dio.options.queryParameters = {
      'ocid': oldOcid,
      'date': yesterday,
      'world_name': basic.worldName,
    };

    // 유니온 랭킹을 통해 메인 캐릭터 확인
    Response unionRankingResponse;
    UnionRanking unionRanking;
    try {
      unionRankingResponse = await dioInstance.dio
          .get(dotenv.get('MAPLESTORY_UNION_RANKING_PATH'));
      unionRanking = UnionRanking.fromJson(unionRankingResponse.data);
    } on DioException catch (e) {
      throw Error();
    }

    // 정보가 없으면 등록하지 않음
    if (unionRanking.ranking != null && unionRanking.ranking!.isNotEmpty) {
      String newOcid = '';
      String newCharacterName = unionRanking.ranking!.first.characterName!;

      ref
          .read(unionMainCharacterProvider.notifier)
          .update((state) => newCharacterName);

      // 현재 캐릭터 이름이 본 캐릭터와 같지 않으면
      String? newCharacterId;
      // print('${basic.characterName} != ${newCharacterName}');
      if (basic.characterName != newCharacterName) {
        // 새로운 캐릭터의 정보를 등록하고
        final newCharacterQuery =
            characterRef.where('characterName', isEqualTo: newCharacterName);
        try {
          QuerySnapshot querySnapshot = await newCharacterQuery.get();
          if (querySnapshot.docs.isNotEmpty) {
            newCharacterId = querySnapshot.docs.first.id;
          } else {
            newCharacterId = null;
          }
        } catch (e) {
          throw Error();
        }

        // print('id 값이 존재해요!!!! ${newCharacterName} == ${newCharacterId}');
        // 근데 새로운 캐릭터의 정보가 존재한다면 id만 가져오면되고
        // 존재하지 않으면 캐릭터 정보를 추가할 수 있도록 캐릭터와 관련된 정보를 가져와야 한다
        if (newCharacterId == null) {
          // print("id 값이 없어서 새로 추가해줘야 해요");
          dioInstance.dio.options.queryParameters = {
            'character_name': newCharacterName
          };

          try {
            final ocidResponse =
                await dioInstance.dio.get(dotenv.get('MAPLESTORY_OCID_PATH'));
            newOcid = ocidResponse.data['ocid'];
          } on DioException catch (e) {
            throw Error();
          }

          dioInstance.dio.options.queryParameters = {
            'ocid': newOcid,
            'date': yesterday
          };

          /**-----basic*/
          Response newBasicResponse;
          Basic newBasic;
          try {
            newBasicResponse =
                await dioInstance.dio.get(dotenv.get('MAPLESTORY_BASIC_PATH'));
            newBasic = Basic.fromJson(newBasicResponse.data);
          } on DioException catch (e) {
            throw Error();
          }
          // 메인 캐릭터의 정보를 가져왔다면, 그 정보를 등록하고 id를 받아오자
          DocumentReference addResultDoc = await characterRef.add(Character(
            characterName: newBasic.characterName,
            characterImage: newBasic.characterImage,
            characterClass: newBasic.characterClass,
            characterLevel: newBasic.characterLevel.toString(),
            characterWorld: newBasic.worldName,
            mainCharacterId: null,
          ));

          newCharacterId = addResultDoc.id;
        }
        // 그 캐릭터의 doc.id를 현재 캐릭터 정보에 추가한 뒤 등록해야 한다.
      }
      // 같으면 그냥 업데이트 해주면된다
      // 근데 업데이트의 경우 newCharacterId가 null이 될 수 있으므로 그냥 넣어주면됨
      // 근데 새로 넣는 친구가 데이터를 추가하는건지 업데이트하는 건지 확인해야한다
      // 즉 검색한 친구의 id도 확인해야 한다는 것이지

      final characterQuery =
          characterRef.where('characterName', isEqualTo: basic.characterName);

      String? characterId;
      try {
        QuerySnapshot querySnapshot = await characterQuery.get();
        if (querySnapshot.docs.isNotEmpty) {
          characterId = querySnapshot.docs.first.id;
        } else {
          characterId = null;
        }
      } catch (e) {
        throw Error();
      }

      if (characterId == null) {
        // print("캐릭터 정보 없으니까 걍 추간한당~~");
        characterRef.add(Character(
          characterName: basic.characterName,
          characterImage: basic.characterImage,
          characterClass: basic.characterClass,
          characterLevel: basic.characterLevel.toString(),
          characterWorld: basic.worldName,
          mainCharacterId: newCharacterId,
        ));
      } else {
        // print("캐릭터 정보 있으니까 업데이트할께~");
        characterRef.doc(characterId).update({
          'characterName': basic.characterName,
          'characterImage': basic.characterImage,
          'characterClass': basic.characterClass,
          'characterLevel': basic.characterLevel.toString(),
          'characterWorld': basic.worldName,
          'mainCharacterId': newCharacterId,
        });
      }
    }
  }

  Future<void> _fetchCharacter() async {
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

    ref
        .read(characterWorldProvider.notifier)
        .update((state) => basic.worldName!);

    await _fetchUnion(oldOcid: ocid, basic: basic);

    ref.read(mainCharacterProvider.notifier).update(
          (state) => MainCharacter(
            basic: basic,
            dojang: dojang,
            // popularity: popularity,
            // propensity: propensity,
            stat: stat,
            union: union,
          ),
        );
  }

  @override
  void build() {}

  Future<void> getNewCharacter() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchCharacter());
  }
}
