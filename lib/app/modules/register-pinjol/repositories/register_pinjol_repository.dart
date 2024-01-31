// import 'dart:ffi';
// ignore_for_file: non_constant_identifier_names

// import 'dart:ffi';

// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:taktix_app/app/models/account.dart';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_app/app/models/province.dart';
import 'package:mobile_app/app/models/district.dart';
import 'package:mobile_app/app/models/regency.dart';
import 'package:mobile_app/app/models/village.dart';

const url = "https://emsifa.github.io/api-wilayah-indonesia/api";

class RegisterPijolRepository {
  Future<List<Province>> getProvinces() async {
    try {
      var response = await Dio().get(
        "$url/provinces.json",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
          },
        ),
      );
      return provinceFromJson(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Regency>> getRegency(data) async {
    try {
      var response = await Dio().get(
        "$url/regencies/$data.json",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
          },
        ),
      );
      print(response.data);
      return regencyFromJson(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<District>> getDistrict(data) async {
    try {
      var response = await Dio().get(
        "$url/districts/$data.json",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
          },
        ),
      );
      return districtFromJson(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Village>> getVillage(data) async {
    try {
      var response = await Dio().get(
        "$url/villages/$data.json",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
          },
        ),
      );
      return villageFromJson(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
