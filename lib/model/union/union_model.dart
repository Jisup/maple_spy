import 'package:intl/intl.dart';

class Union {
  String? date;
  String? unionLevel;
  String? unionGrade;
  String? unionSubGrade;
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

    if (unionGrade != null) {
      var gradeInfo = unionGrade!.split(' ');
      var gradeType = gradeInfo.first;
      var gradeLevel = gradeInfo.last;

      switch (gradeLevel) {
        case '1':
          unionGrade = unionGrade!.replaceAll('1', 'Ⅰ');
          gradeLevel = 'Ⅰ';
          break;
        case '2':
          unionGrade = unionGrade!.replaceAll('2', 'Ⅱ');
          gradeLevel = 'Ⅱ';
          break;
        case '3':
          unionGrade = unionGrade!.replaceAll('3', 'Ⅲ');
          gradeLevel = 'Ⅲ';
          break;
        case '4':
          unionGrade = unionGrade!.replaceAll('4', 'Ⅳ');
          gradeLevel = 'Ⅳ';
          break;
        case '5':
          unionGrade = unionGrade!.replaceAll('5', 'Ⅴ');
          gradeLevel = 'Ⅴ';
          break;
      }
      switch (gradeType) {
        case '노비스':
          unionSubGrade = 'NOVICE UNION ${gradeLevel}';
          break;
        case '베테랑':
          unionSubGrade = 'VETERAN UNION ${gradeLevel}';
          break;
        case '마스터':
          unionSubGrade = 'MASTER UNION ${gradeLevel}';
          break;
        case '그랜드':
          unionSubGrade = 'GRAND MASTER UNION ${gradeLevel}';
          break;
        case '슈프림':
          unionSubGrade = 'SUPREME UNION ${gradeLevel}';
          break;
        default:
          unionSubGrade = null;
      }
    }

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
