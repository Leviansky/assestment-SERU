// To parse this JSON data, do
//
//     final regency = regencyFromJson(jsonString);

import 'dart:convert';

List<Regency> regencyFromJson(String str) =>
    List<Regency>.from(json.decode(str).map((x) => Regency.fromJson(x)));

String regencyToJson(List<Regency> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Regency {
  String? id;
  String? provinceId;
  String? name;

  Regency({
    this.id,
    this.provinceId,
    this.name,
  });

  factory Regency.fromJson(Map<String, dynamic> json) => Regency(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
}
