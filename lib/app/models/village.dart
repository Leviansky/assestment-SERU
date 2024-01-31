// To parse this JSON data, do
//
//     final village = villageFromJson(jsonString);

import 'dart:convert';

List<Village> villageFromJson(String str) =>
    List<Village>.from(json.decode(str).map((x) => Village.fromJson(x)));

String villageToJson(List<Village> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Village {
  String? id;
  String? districtId;
  String? name;

  Village({
    this.id,
    this.districtId,
    this.name,
  });

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        id: json["id"],
        districtId: json["district_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "name": name,
      };
}
