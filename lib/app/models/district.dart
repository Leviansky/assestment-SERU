// To parse this JSON data, do
//
//     final district = districtFromJson(jsonString);

import 'dart:convert';

List<District> districtFromJson(String str) =>
    List<District>.from(json.decode(str).map((x) => District.fromJson(x)));

String districtToJson(List<District> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class District {
  String? id;
  String? regencyId;
  String? name;

  District({
    this.id,
    this.regencyId,
    this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        regencyId: json["regency_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regency_id": regencyId,
        "name": name,
      };
}
