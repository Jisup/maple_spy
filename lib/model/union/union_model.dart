import 'package:intl/intl.dart';

class Union {
  String? date;
  String? unionLevel;
  String? unionGrade;
  int? unionArtifactLevel;
  int? unionArtifactExp;
  int? unionArtifactPoint;

  Union(
      {this.date,
      this.unionLevel,
      this.unionGrade,
      this.unionArtifactLevel,
      this.unionArtifactExp,
      this.unionArtifactPoint});

  Union.fromJson(Map<String, dynamic> json) {
    date = json['date'];

    var mainFormatter = NumberFormat('#,###,###,###,###,###', 'ko_KR');
    unionLevel = mainFormatter.format(json['union_level'] ?? 0);

    unionGrade = json['union_grade'];
    unionArtifactLevel = json['union_artifact_level'];
    unionArtifactExp = json['union_artifact_exp'];
    unionArtifactPoint = json['union_artifact_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['union_level'] = this.unionLevel;
    data['union_grade'] = this.unionGrade;
    data['union_artifact_level'] = this.unionArtifactLevel;
    data['union_artifact_exp'] = this.unionArtifactExp;
    data['union_artifact_point'] = this.unionArtifactPoint;
    return data;
  }
}
