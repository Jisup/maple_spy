class ItemSetEffect {
  String? date;
  List<SetEffect>? setEffect;

  ItemSetEffect({this.date, this.setEffect});

  ItemSetEffect.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['set_effect'] != null) {
      setEffect = <SetEffect>[];
      json['set_effect'].forEach((v) {
        setEffect!.add(new SetEffect.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.setEffect != null) {
      data['set_effect'] = this.setEffect!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SetEffect {
  String? setName;
  int? totalSetCount;
  List<SetEffectInfo>? setEffectInfo;

  SetEffect({this.setName, this.totalSetCount, this.setEffectInfo});

  SetEffect.fromJson(Map<String, dynamic> json) {
    setName = json['set_name'];
    totalSetCount = json['total_set_count'];
    if (json['set_effect_info'] != null) {
      setEffectInfo = <SetEffectInfo>[];
      json['set_effect_info'].forEach((v) {
        setEffectInfo!.add(new SetEffectInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_name'] = this.setName;
    data['total_set_count'] = this.totalSetCount;
    if (this.setEffectInfo != null) {
      data['set_effect_info'] =
          this.setEffectInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SetEffectInfo {
  int? setCount;
  String? setOption;

  SetEffectInfo({this.setCount, this.setOption});

  SetEffectInfo.fromJson(Map<String, dynamic> json) {
    setCount = json['set_count'];
    setOption = json['set_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['set_count'] = this.setCount;
    data['set_option'] = this.setOption;
    return data;
  }
}
