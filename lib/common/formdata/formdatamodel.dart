// To parse this JSON data, do
//
//     final testjson = testjsonFromJson(jsonString);

import 'dart:convert';

Testjson testjsonFromJson(String str) => Testjson.fromJson(json.decode(str));

String testjsonToJson(Testjson data) => json.encode(data.toJson());

class Testjson {
  Testjson({
    required this.state,
    required this.dist,
    required this.tahsil,
    required this.block,
    required this.panchayat,
    required this.village,
  });

  String state;
  List<String> dist;
  List<dynamic> tahsil;
  List<dynamic> block;
  List<dynamic> panchayat;
  List<dynamic> village;

  factory Testjson.fromJson(Map<String, dynamic> json) => Testjson(
    state: json["state"],
    dist: List<String>.from(json["dist"].map((x) => x)),
    tahsil: List<dynamic>.from(json["tahsil"].map((x) => x)),
    block: List<dynamic>.from(json["block"].map((x) => x)),
    panchayat: List<dynamic>.from(json["panchayat"].map((x) => x)),
    village: List<dynamic>.from(json["village"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "dist": List<dynamic>.from(dist.map((x) => x)),
    "tahsil": List<dynamic>.from(tahsil.map((x) => x)),
    "block": List<dynamic>.from(block.map((x) => x)),
    "panchayat": List<dynamic>.from(panchayat.map((x) => x)),
    "village": List<dynamic>.from(village.map((x) => x)),
  };
}
