class Popularity {
  String? date;
  int? popularity;

  Popularity({this.date, this.popularity});

  Popularity.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['popularity'] = this.popularity;
    return data;
  }
}
