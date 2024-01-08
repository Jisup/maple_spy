import 'package:maplespy/model/character/basic_model.dart';
import 'package:maplespy/model/character/dojang_model.dart';
import 'package:maplespy/model/character/popularity_model.dart';
import 'package:maplespy/model/character/propensity_model.dart';
import 'package:maplespy/model/stat/stat_model.dart';
import 'package:maplespy/model/union/union_model.dart';

class MainCharacter {
  Basic? basic;
  Dojang? dojang;
  Popularity? popularity;
  Propensity? propensity;

  Stat? stat;
  Union? union;

  MainCharacter({this.basic, this.dojang, this.popularity, this.propensity, this.stat, this.union});
}
