class UserRegisterModel {
   int? id;
  late String country;
  late String state;
  late String district;
  late String tehsil;
  late String block;
  late String panchayat;
  late String village;
  late String gender;
  late String hh_uniqe_indefy;
  late String name_of_beneficiary;
  late String education;
  late String occupation;
  late int number_hh_member;
  late int phone_no;
  late int aadhar;
  late String caste_category;
  late String hh_disability;
  late int hh_disability_number;
  late String season_migration;
  late String image;
  late String distribution;
  late String model_project_tech;
  late String type_project_tech;
  late String quantity_project_tech;
  late String quantity_equip;
  late String serial_num_project;
  late String date_of_sale;
  late String date_of_tech_training;

  UserRegisterModel(

      {this.id,
      required this.country,
      required this.state,
      required this.district,
      required this.tehsil,
      required this.block,
      required this.panchayat,
      required this.village,
      required this.gender,
      required this.hh_uniqe_indefy,
      required this.name_of_beneficiary,
      required this.education,
      required this.occupation,
      required this.number_hh_member,
      required this.phone_no,
      required this.aadhar,
      required this.caste_category,
      required this.hh_disability,
      required this.hh_disability_number,
      required this.season_migration,
      required this.image,
      required this.distribution,
      required this.model_project_tech,
      required this.type_project_tech,
      required this.quantity_project_tech,
      required this.quantity_equip,
      required this.serial_num_project,
      required this.date_of_sale,
      required this.date_of_tech_training});

  factory UserRegisterModel.fromMap(Map<String, dynamic> json) =>
      UserRegisterModel(
        id: json['id'],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        tehsil: json["tehsil"],
        panchayat: json["panchayat"],
        block: json["block"],
        village: json["village"],
        gender: json["gender"],
        hh_uniqe_indefy: json["hh_uniqe_indefy"],
        name_of_beneficiary: json["name_of_beneficiary"],
        education: json["education"],
        occupation: json["occupation"],
        number_hh_member: json["number_hh_member"],
        phone_no: json["phone_no"],
        aadhar: json["aadhar"],
        caste_category: json["caste_category"],
        hh_disability: json["hh_disability"],
        hh_disability_number: json["hh_disability_number"],
        season_migration: json["season_migration"],
        image: json["image"],
        distribution: json["distribution"],
        model_project_tech: json["model_project_tech"],
        type_project_tech: json["type_project_tech"],
        quantity_project_tech: json["quantity_project_tech"],
        quantity_equip: json["quantity_equip"],
        serial_num_project: json["serial_num_project"],
        date_of_sale: json["date_of_sale"],
        date_of_tech_training: json["date_of_tech_training"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "country": country,
        "state": state,
        "district": district,
        "tehsil": tehsil,
        "block": block,
        "panchayat": panchayat,
        "village": village,
        "gender": gender,
        "hh_uniqe_indefy": hh_uniqe_indefy,
        "name_of_beneficiary": name_of_beneficiary,
        "education": education,
        "occupation": occupation,
        "number_hh_member": number_hh_member,
        "phone_no": phone_no,
        "aadhar": aadhar,
        "caste_category": caste_category,
        "hh_disability": hh_disability,
        "hh_disability_number": hh_disability_number,
        "season_migration": season_migration,
        "image": image,
        "distribution": distribution,
        "model_project_tech": model_project_tech,
        "type_project_tech": type_project_tech,
        "quantity_project_tech": quantity_project_tech,
        "quantity_equip": quantity_equip,
        "serial_num_project": serial_num_project,
        "date_of_sale": date_of_sale,
        "date_of_tech_training": date_of_tech_training
      };
}
