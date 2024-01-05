import 'package:intl/intl.dart';

class Union {
  String? date;
  String? unionLevel;
  String? unionGrade;

  Union({this.date, this.unionLevel, this.unionGrade});

  Union.fromJson(Map<String, dynamic> json) {
    date = json['date'];

    var mainFormatter = NumberFormat('#,###,###,###,###,###', 'ko_KR');
    unionLevel = mainFormatter.format(json['union_level'] ?? 0);

    unionGrade = json['union_grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['union_level'] = this.unionLevel;
    data['union_grade'] = this.unionGrade;
    return data;
  }
}
