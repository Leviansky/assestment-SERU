// import 'dart:ffi';
// ignore_for_file: non_constant_identifier_names

// import 'dart:ffi';

// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:taktix_app/app/models/account.dart';

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_app/app/models/province.dart';
import 'package:mobile_app/app/models/district.dart';
import 'package:mobile_app/app/models/regency.dart';
import 'package:mobile_app/app/models/village.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

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

  Future<String?> sendData(
      {required String firstName,
      required String lastName,
      required String province,
      required String regency,
      required String district,
      required String village,
      required File ktp,
      required File selfie}) async {
    try {
      //DATA BERUPA JSON
      var jsonData = {
        "firstName": firstName,
        "lastName": lastName,
        "province": province,
        "regency": regency,
        "district": district,
        "village": village,
        "ktp": ktp.path != 'null'
            ? {
                "file": await MultipartFile.fromFile(
                  ktp.path,
                  filename: ktp.path.split('/').last,
                  contentType: MediaType('image', lookupMimeType(ktp.path)!),
                ),
              }
            : null,
        "selfie": selfie.path != 'null'
            ? {
                "file": await MultipartFile.fromFile(
                  selfie.path,
                  filename: selfie.path.split('/').last,
                  contentType: MediaType('image', lookupMimeType(selfie.path)!),
                ),
              }
            : null,
      };

      //DATA BERUPA FORMDATA
      var formData = FormData.fromMap({
        "firstName": firstName,
        "lastName": lastName,
        "province": province,
        "regency": regency,
        "district": district,
        "village": village,
        "ktp": ktp.path != 'null'
            ? await MultipartFile.fromFile(
                ktp.path,
                filename: ktp.path.split('/').last,
                contentType: MediaType('image', lookupMimeType(ktp.path)!),
              )
            : 'null',
        "selfie": selfie.path != 'null'
            ? await MultipartFile.fromFile(
                selfie.path,
                filename: selfie.path.split('/').last,
                contentType: MediaType('image', lookupMimeType(selfie.path)!),
              )
            : 'null',
      });

      // var response = await Dio().post(
      //   "xxxx",
      //   options: Options(
      //     headers: {
      //       HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType,
      //       "Content-Type": "application/json",
      //       'Accept': 'application/json',
      //     },
      //   ),
      //   data: formData,
      // );

      print(jsonData);
      print(formData);
      return "Bismillah diterima :)";
    } catch (e) {
      rethrow;
    }
  }
}
