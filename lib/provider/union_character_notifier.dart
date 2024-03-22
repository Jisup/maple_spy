import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/model/firestore/character.dart';
import 'package:maplespy/model/union/union_ranking_model.dart';
import 'package:maplespy/provider/character_notifier.dart';
import 'package:maplespy/provider/common_provider.dart';

final asyncUnionCharacterProvider =
    AsyncNotifierProvider(UnionCharacterNotifier.new);

class UnionCharacterNotifier extends AsyncNotifier {
  final oldCharacterNameProvider = StateProvider(
    (ref) => "",
  );
  final unionRankingProvider = StateProvider(
    (ref) => UnionRanking(),
  );
  final unionMainCharacterProvider = StateProvider(
    (ref) => Character(),
  );
  final unionSubCharacterProvider = StateProvider(
    (ref) => [],
  );

  Future<void> _fetchUnionCharacter() async {
    String? newCharacterName = ref.read(
        ref.read(asyncCharacterProvider.notifier).unionMainCharacterProvider);

    //newCharacterName이 유니온 대빵이니까
    //fireStore에 유니온 대빵의 mainCharacterId로 가지는 친구들을 가져오면돼

    final db = FirebaseFirestore.instance;
    final characterRef = db.collection('characters').withConverter(
        fromFirestore: Character.fromFirestore,
        toFirestore: (Character character, options) => character.toFirestore());

    final mainCharacterQuery =
        characterRef.where('characterName', isEqualTo: newCharacterName);

    String mainCharacterId = '';
    Character mainCharacter;
    try {
      QuerySnapshot querySnapshot = await mainCharacterQuery.get();
      mainCharacterId = querySnapshot.docs.first.id;
      mainCharacter = querySnapshot.docs.first.data() as Character;
    } catch (e) {
      throw Error();
    }

    ref
        .read(unionMainCharacterProvider.notifier)
        .update((state) => mainCharacter);

    final subCharacterQuery =
        characterRef.where('mainCharacterId', isEqualTo: mainCharacterId);

    List<Character> subCharacter = [];
    try {
      QuerySnapshot querySnapshot = await subCharacterQuery.get();
      for (var docSnapshot in querySnapshot.docs) {
        subCharacter.add(docSnapshot.data() as Character);
      }
    } catch (e) {
      throw Error();
    }

    subCharacter.sort((a, b) {
      if (a.characterLevel == b.characterLevel) {
        return a.characterName!.compareTo(b.characterName!);
      }
      return int.parse(b.characterLevel!) - int.parse(a.characterLevel!);
    });

    ref
        .read(unionSubCharacterProvider.notifier)
        .update((state) => subCharacter);
  }

  @override
  void build() {}

  Future<void> getNewUnionCharacter() async {
    final oldCharacterName = ref.read(oldCharacterNameProvider);
    final newCharacterName = ref.read(characterNameProvider);

    if (oldCharacterName == newCharacterName) return;

    ref
        .read(oldCharacterNameProvider.notifier)
        .update((state) => newCharacterName);

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchUnionCharacter());
  }
}
