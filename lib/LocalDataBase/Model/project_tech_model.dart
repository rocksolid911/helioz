class ProjectTechModel {
  int? id;
  late String conditionOfProject;
  late String projectTechUseVisit;
  late String demonstrationProject;
  late String averageNumTechWeek;
  late String reasonOfNotUse;
  late String typeOfTreatMethod;
  late String averageWaterTreatedPerDay;
  late String averageWaterTreatedPerDayPerson;
  late String boilDrinkingWater;
  late String boilDrinkingWaterAddition;
  late String availabilityDrinkingWater;
  late String reductionOfWaterBorne;
  late String reductionOfSickDay;
  late String reductionOfMedicalCost;
  late String reductionOfBoilingDrinkingWater;
  late String reductionSpendTimeFirewood;
  late String storeWaterProjectTech;
  late String howLongStoreWater;
  late String untreatedWaterHealth;
  late String likeProjectTech;
  late String likeProjectActivity;
  late String grievanceProjectTech;
  late String grievanceProjectActivity;

  ProjectTechModel(
      {this.id,
      required this.conditionOfProject,
      required this.projectTechUseVisit,
      required this.demonstrationProject,
      required this.averageNumTechWeek,
      required this.reasonOfNotUse,
      required this.typeOfTreatMethod,
      required this.averageWaterTreatedPerDay,
      required this.averageWaterTreatedPerDayPerson,
      required this.boilDrinkingWater,
      required this.boilDrinkingWaterAddition,
      required this.availabilityDrinkingWater,
      required this.reductionOfWaterBorne,
      required this.reductionOfSickDay,
      required this.reductionOfMedicalCost,
      required this.reductionOfBoilingDrinkingWater,
      required this.reductionSpendTimeFirewood,
      required this.storeWaterProjectTech,
      required this.howLongStoreWater,
      required this.untreatedWaterHealth,
      required this.likeProjectTech,
      required this.likeProjectActivity,
      required this.grievanceProjectTech,
      required this.grievanceProjectActivity});

  factory ProjectTechModel.fromMap(Map<String, dynamic> json) =>
      ProjectTechModel(
          id: json['id'],
          conditionOfProject: json['condition_of_project'],
          projectTechUseVisit: json['project_tech_use_visit'],
          demonstrationProject: json['demonstration_of_project'],
          averageNumTechWeek: json["average_num_tech_week"],
          reasonOfNotUse: json["reason_of_not_use"],
          typeOfTreatMethod: json["type_of_treat_method"],
          averageWaterTreatedPerDay: json["average_water_treated_per_day"],
          averageWaterTreatedPerDayPerson:
              json["average_water_treated_per_day_person"],
          boilDrinkingWater: json["boil_drinking_water"],
          boilDrinkingWaterAddition: json["boil_drinking_addition"],
          availabilityDrinkingWater: json["availability_drinking_water"],
          reductionOfWaterBorne: json["reduction_of_waterborne"],
          reductionOfSickDay: json["reduction_of_sick_day"],
          reductionOfMedicalCost: json["reduction_of_medical_cost"],
          reductionOfBoilingDrinkingWater:
              json["reduction_of_boiling_drinking_water"],
          reductionSpendTimeFirewood: json["reduction_spend_time_firewood"],
          storeWaterProjectTech: json["store_water_project_tech"],
          howLongStoreWater: json["how_long_store_water"],
          untreatedWaterHealth: json["untreated_water_health"],
          likeProjectTech: json["like_project_tech"],
          likeProjectActivity: json["like_project_activity"],
          grievanceProjectTech: json["grievances_project_tech"],
          grievanceProjectActivity: json["grievances_project_activity"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "condition_of_project": conditionOfProject,
        "project_tech_use_visit": projectTechUseVisit,
        "demonstration_of_project": demonstrationProject,
        "average_num_tech_week": averageNumTechWeek,
        "reason_of_not_use": reasonOfNotUse,
        "type_of_treat_method": typeOfTreatMethod,
        "average_water_treated_per_day": averageWaterTreatedPerDay,
        "average_water_treated_per_day_person": averageWaterTreatedPerDayPerson,
        "boil_drinking_water": boilDrinkingWater,
        "boil_drinking_addition": boilDrinkingWaterAddition,
        "availability_drinking_water": availabilityDrinkingWater,
        "reduction_of_waterborne": reductionOfWaterBorne,
        "reduction_of_sick_day": reductionOfSickDay,
        "reduction_of_medical_cost": reductionOfMedicalCost,
        "reduction_of_boiling_drinking_water": reductionOfBoilingDrinkingWater,
        "reduction_spend_time_firewood": reductionSpendTimeFirewood,
        "store_water_project_tech": storeWaterProjectTech,
        "how_long_store_water": howLongStoreWater,
        "untreated_water_health": untreatedWaterHealth,
        "like_project_tech": likeProjectTech,
        "like_project_activity": likeProjectActivity,
        "grievances_project_tech": grievanceProjectTech,
        "grievances_project_activity": grievanceProjectActivity
      };
}
