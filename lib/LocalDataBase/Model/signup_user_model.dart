class SignUpUserModel {
  late int id;
  late String name;
  late String password;
  late String email;

  SignUpUserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  factory SignUpUserModel.fromMap(Map<String, dynamic> json) => SignUpUserModel(
        id: json['id'],
        name: json["name"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "password": password,
        "email": email,
      };
}
