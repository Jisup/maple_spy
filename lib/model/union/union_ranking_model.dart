class UnionRanking {
  List<Ranking>? ranking;

  UnionRanking({this.ranking});

  UnionRanking.fromJson(Map<String, dynamic> json) {
    if (json['ranking'] != null) {
      ranking = <Ranking>[];
      json['ranking'].forEach((v) {
        ranking!.add(new Ranking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ranking != null) {
      data['ranking'] = this.ranking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ranking {
  String? date;
  int? ranking;
  String? characterName;
  String? worldName;
  String? className;
  String? subClassName;
  int? unionLevel;
  int? unionPower;

  Ranking(
      {this.date,
      this.ranking,
      this.characterName,
      this.worldName,
      this.className,
      this.subClassName,
      this.unionLevel,
      this.unionPower});

  Ranking.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    ranking = json['ranking'];
    characterName = json['character_name'];
    worldName = json['world_name'];
    className = json['class_name'];
    subClassName = json['sub_class_name'];
    unionLevel = json['union_level'];
    unionPower = json['union_power'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['ranking'] = this.ranking;
    data['character_name'] = this.characterName;
    data['world_name'] = this.worldName;
    data['class_name'] = this.className;
    data['sub_class_name'] = this.subClassName;
    data['union_level'] = this.unionLevel;
    data['union_power'] = this.unionPower;
    return data;
  }
}