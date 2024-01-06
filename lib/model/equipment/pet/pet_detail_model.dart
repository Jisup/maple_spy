import 'package:maplespy/model/equipment/pet_item_model.dart';

class PetDetail {
  List<Pet> petList = [];
  PetDetail({required PetItem petItem}) {
    petList.add(Pet(
        petName: petItem.pet1Name,
        petNickname: petItem.pet1Nickname,
        petIcon: petItem.pet1Icon,
        petDescription: petItem.pet1Description,
        petEquipment: petItem.pet1Equipment,
        petAutoSkill: petItem.pet1AutoSkill,
        petPetType: petItem.pet1PetType,
        petSkill: petItem.pet1Skill,
        petDateExpire: petItem.pet1DateExpire));
    petList.add(Pet(
        petName: petItem.pet2Name,
        petNickname: petItem.pet2Nickname,
        petIcon: petItem.pet2Icon,
        petDescription: petItem.pet2Description,
        petEquipment: petItem.pet2Equipment,
        petAutoSkill: petItem.pet2AutoSkill,
        petPetType: petItem.pet2PetType,
        petSkill: petItem.pet2Skill,
        petDateExpire: petItem.pet2DateExpire));
    petList.add(Pet(
        petName: petItem.pet3Name,
        petNickname: petItem.pet3Nickname,
        petIcon: petItem.pet3Icon,
        petDescription: petItem.pet3Description,
        petEquipment: petItem.pet3Equipment,
        petAutoSkill: petItem.pet3AutoSkill,
        petPetType: petItem.pet3PetType,
        petSkill: petItem.pet3Skill,
        petDateExpire: petItem.pet3DateExpire));
  }
}

class Pet {
  String? petName;
  String? petNickname;
  String? petIcon;
  String? petDescription;
  PetEquipment? petEquipment;
  PetAutoSkill? petAutoSkill;
  String? petPetType;
  List<String>? petSkill;
  String? petDateExpire;

  Pet({
    required this.petName,
    required this.petNickname,
    required this.petIcon,
    required this.petDescription,
    required this.petEquipment,
    required this.petAutoSkill,
    required this.petPetType,
    required this.petSkill,
    required this.petDateExpire,
  });
}
