class HomeModel {
  String? id;
  String? icon;
  String? title;

  HomeModel({this.id, this.icon, this.title});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['title'] = title;
    return data;
  }
}
