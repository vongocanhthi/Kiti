class UserModel {
  String? id;
  String? avatar;
  String? name;
  String? age;
  String? money;
  String? phoneNumber;
  String? email;
  String? momo;
  String? zalopay;

  UserModel(
      {this.id,
      this.avatar,
      this.name,
      this.age,
      this.money,
      this.phoneNumber,
      this.email,
      this.momo,
      this.zalopay});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    age = json['age'];
    money = json['money'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    momo = json['momo'];
    zalopay = json['zalopay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    data['age'] = age;
    data['money'] = money;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['momo'] = momo;
    data['zalopay'] = zalopay;
    return data;
  }
}
