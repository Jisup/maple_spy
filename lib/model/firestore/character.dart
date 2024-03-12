import 'package:cloud_firestore/cloud_firestore.dart';

class Character {
  String? characterName;
  String? characterImage;
  String? characterClass;
  String? characterLevel;
  String? characterWorld;
  String? mainCharacterId;

  Character({
    this.characterName,
    this.characterImage,
    this.characterClass,
    this.characterLevel,
    this.characterWorld,
    this.mainCharacterId,
  });

  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Character(
      characterName: data?['characterName'],
      characterImage: data?['characterImage'],
      characterClass: data?['characterClass'],
      characterLevel: data?['characterLevel'],
      characterWorld: data?['characterWorld'],
      mainCharacterId: data?['mainCharacterId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (characterName != null) "characterName": characterName,
      if (characterImage != null) "characterImage": characterImage,
      if (characterClass != null) "characterClass": characterClass,
      if (characterLevel != null) "characterLevel": characterLevel,
      if (characterWorld != null) "characterWorld": characterWorld,
      if (mainCharacterId != null) "mainCharacterId": mainCharacterId,
    };
  }
}
