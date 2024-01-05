import 'package:intl/intl.dart';

class Stat {
  String? date;
  String? characterClass;
  List<FinalStat>? finalStat;
  int? remainAp;

  Stat({this.date, this.characterClass, this.finalStat, this.remainAp});

  Stat.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    characterClass = json['character_class'];
    if (json['final_stat'] != null) {
      finalStat = <FinalStat>[];
      json['final_stat'].forEach((v) {
        finalStat!.add(new FinalStat.fromJson(v));
      });
    }
    remainAp = json['remain_ap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['character_class'] = this.characterClass;
    if (this.finalStat != null) {
      data['final_stat'] = this.finalStat!.map((v) => v.toJson()).toList();
    }
    data['remain_ap'] = this.remainAp;
    return data;
  }
}

class FinalStat {
  String? statName;
  String? statValue;

  FinalStat({this.statName, this.statValue});

  FinalStat.fromJson(Map<String, dynamic> json) {
    var mainFormatter = NumberFormat('#,###,###,###,###,###', 'ko_KR');
    var subFormatter = NumberFormat('####,####,####,####', 'ko_KR');
    // var percentFormatter = NumberFormat('###.##', 'en_US');
    var measure = ['억', '만', ''];

    statName = json['stat_name'];
    statValue = json['stat_value'];

    switch (statName) {
      case '최소 스탯공격력':
      case '최대 스탯공격력':
      case '전투력':
        var value =
            subFormatter.format(int.parse(statValue!)).toString().split(',');
        var len = measure.length - value.length;
        statValue = '';
        for (var i = 0; i < value.length; i++) {
          statValue =
              '${statValue!}${i != 0 ? ' ' : ''}${value[i]}${measure[len + i]}';
        }
        break;
      case '데미지':
      case '보스 몬스터 데미지':
      case '최종 데미지':
      case '방어율 무시':
      case '크리티컬 확률':
      case '크리티컬 데미지':
      case '아이템 드롭률':
      case '메소 획득량':
      case '버프 지속시간':
      case '일반 몬스터 데미지':
      case '재사용 대기시간 감소 (%)':
      case '재사용 대기시간 미적용':
      case '속성 내성 무시':
      case '상태이상 추가 데미지':
      case '추가 경험치 획득':
      case '이동속도':
      case '점프력':
        statValue = '${statValue!}%';
        break;
      case '재사용 대기시간 감소 (초)':
        statValue = '${statValue}초';
      case '공격 속도':
        statValue = '${statValue}단계';
        break;
      default:
        statValue = mainFormatter.format(int.parse(statValue!)).toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat_name'] = this.statName;
    data['stat_value'] = this.statValue;
    return data;
  }
}
