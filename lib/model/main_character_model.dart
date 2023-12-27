import 'package:maple_app/model/character/basic_model.dart';
import 'package:maple_app/model/character/dojang_model.dart';
import 'package:maple_app/model/character/popularity_model.dart';
import 'package:maple_app/model/character/propensity_model.dart';

class MainCharacter {
  String? ocid;
  Basic? basic;
  Dojang? dojang;
  Popularity? popularity;
  Propensity? propensity;

  MainCharacter(
      {this.ocid, this.basic, this.dojang, this.popularity, this.propensity});

  MainCharacter copyWith(
          {String? ocid,
          Basic? basic,
          Dojang? dojang,
          Popularity? popularity,
          Propensity? propensity}) =>
      MainCharacter(
          ocid: ocid ?? this.ocid,
          basic: basic ?? this.basic,
          dojang: dojang ?? this.dojang,
          popularity: popularity ?? this.popularity,
          propensity: propensity ?? this.propensity);
}
