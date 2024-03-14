class Notice {
  String? title;
  String? body;
  String? date;
  String? footer;

  Notice({this.title, this.body, this.date, this.footer});

  Notice.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    date = json['date'];
    footer = json['footer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['title'] = this.title;
    data['footer'] = this.footer;
    data['body'] = this.body;
    return data;
  }
}
