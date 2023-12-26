class Propensity {
  String? date;
  int? charismaLevel;
  int? sensibilityLevel;
  int? insightLevel;
  int? willingnessLevel;
  int? handicraftLevel;
  int? charmLevel;

  Propensity(
      {this.date,
      this.charismaLevel,
      this.sensibilityLevel,
      this.insightLevel,
      this.willingnessLevel,
      this.handicraftLevel,
      this.charmLevel});

  Propensity.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    charismaLevel = json['charisma_level'];
    sensibilityLevel = json['sensibility_level'];
    insightLevel = json['insight_level'];
    willingnessLevel = json['willingness_level'];
    handicraftLevel = json['handicraft_level'];
    charmLevel = json['charm_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['charisma_level'] = this.charismaLevel;
    data['sensibility_level'] = this.sensibilityLevel;
    data['insight_level'] = this.insightLevel;
    data['willingness_level'] = this.willingnessLevel;
    data['handicraft_level'] = this.handicraftLevel;
    data['charm_level'] = this.charmLevel;
    return data;
  }
}
