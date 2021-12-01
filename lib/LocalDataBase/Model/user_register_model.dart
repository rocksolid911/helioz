class UserRegisterModel {
  late int id;
  late String name;
  late String mobile;
  late String password;
  late String email;
  late String date;
  late String address;
  late String profession;

  UserRegisterModel({
    required this.id,
    required  this.name,
    required  this.password,
    required this.address,
    required this.mobile,
    required this.email,
    required  this.date,
    required  this.profession,
  });

  factory UserRegisterModel.fromMap(Map<String, dynamic> json) => UserRegisterModel(
    id: json['id'],
    name: json["name"],
    password: json["password"],
    mobile: json["mobile"],
    email: json["email"],
    date: json["date"],
    address: json["address"],
    profession: json["profession"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "password": password,
    "mobile": mobile,
    "email": email,
    "address": address,
    "date": date,
    "profession": profession,
  };
}