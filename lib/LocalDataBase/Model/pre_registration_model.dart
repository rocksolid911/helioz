class UserPreRegisterModel {
  int? id;
  late String nameOfBeneficiary;
  late String gender;
  late String state;
  late String district;
  late String block;
  late String village;
  late int phoneNo;
  late String mainFuelSource;
  late String mainFuelSourceDry;
  late String mainFuelSourceRainy;
  late String waterTreatmentDry;
  late String waterTreatmentDryMethod;
  late String waterTreatmentRainy;
  late String waterTreatmentRainyMethod;
  late String typeProjectTech;
  late String numberProjectTech;

  UserPreRegisterModel(
      {this.id,
      required this.nameOfBeneficiary,
      required this.gender,
      required this.state,
      required this.district,
      required this.block,
      required this.village,
      required this.phoneNo,
      required this.mainFuelSource,
      required this.mainFuelSourceDry,
      required this.mainFuelSourceRainy,
      required this.waterTreatmentDry,
      required this.waterTreatmentDryMethod,
      required this.waterTreatmentRainy,
      required this.waterTreatmentRainyMethod,
      required this.typeProjectTech,
      required this.numberProjectTech});

  factory UserPreRegisterModel.fromMap(Map<String, dynamic> json) =>
      UserPreRegisterModel(
          id: json['id'],
          nameOfBeneficiary: json['name_of_beneficiary'],
          gender: json['gender'],
          state: json['state'],
          district: json["district"],
          block: json["block"],
          village: json["village"],
          phoneNo: json["phone_no"],
          mainFuelSource: json["main_fuel_source"],
          mainFuelSourceDry: json["main_fuel_source_dry"],
          mainFuelSourceRainy: json["main_fuel_source_rainy"],
          waterTreatmentDry: json["water_treatment_dry"],
          waterTreatmentDryMethod: json["water_treatment_dry_method"],
          waterTreatmentRainy: json["water_treatment_rainy"],
          waterTreatmentRainyMethod: json["water_treatment_rainy_method"],
          typeProjectTech: json["type_project_tech"],
          numberProjectTech: json["number_project_tech"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name_of_beneficiary": nameOfBeneficiary,
        "gender": gender,
        "state": state,
        "district": district,
        "block": block,
        "village": village,
        "phone_no": phoneNo,
        "main_fuel_source": mainFuelSource,
        "main_fuel_source_dry": mainFuelSourceDry,
        "main_fuel_source_rainy": mainFuelSourceRainy,
        "water_treatment_dry": waterTreatmentDry,
        "water_treatment_dry_method": waterTreatmentDryMethod,
        "water_treatment_rainy": waterTreatmentRainy,
        "water_treatment_rainy_method": waterTreatmentRainyMethod,
        "type_project_tech": typeProjectTech,
        "number_project_tech": numberProjectTech
      };
}
