class Dojang {
  String? date;
  String? characterClass;
  String? worldName;
  int? dojangBestFloor;
  String? dateDojangRecord;
  int? dojangBestTime;

  Dojang(
      {this.date,
      this.characterClass,
      this.worldName,
      this.dojangBestFloor,
      this.dateDojangRecord,
      this.dojangBestTime});

  Dojang.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    worldName = json['world_name'];
    dojangBestFloor = json['dojang_best_floor'];
    dateDojangRecord = json['date_dojang_record'];
    dojangBestTime = json['dojang_best_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    data['world_name'] = this.worldName;
    data['dojang_best_floor'] = this.dojangBestFloor;
    data['date_dojang_record'] = this.dateDojangRecord;
    data['dojang_best_time'] = this.dojangBestTime;
    return data;
  }
}
