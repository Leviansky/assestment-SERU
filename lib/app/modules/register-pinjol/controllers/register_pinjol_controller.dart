import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/province.dart';
import 'package:mobile_app/app/models/district.dart';
import 'package:mobile_app/app/models/regency.dart';
import 'package:mobile_app/app/models/village.dart';
import 'package:mobile_app/app/modules/register-pinjol/repositories/register_pinjol_repository.dart';

class RegisterPinjolController extends GetxController {
  static RegisterPinjolController get to => Get.find();
  final network = RegisterPijolRepository();

  init() {
    getProvince();
  }

  final dataProvinces = RxList<Province>([]);
  final listProvinces = RxList<String>([]);
  final dataRegency = RxList<Regency>([]);
  final listRegency = RxList<String>([]);
  final dataDistrict = RxList<District>([]);
  final listDistrict = RxList<String>([]);
  final dataVillage = RxList<Village>([]);
  final listVillage = RxList<String>([]);

  final firstName = TextEditingController();
  final errorFirstName = false.obs;
  final lastName = TextEditingController();
  final errorLastName = false.obs;
  final biodata = TextEditingController();
  final errorBiodata = false.obs;
  String? selectedProvince;
  final errorProvince = false.obs;
  String? selectedRegency;
  final errorRegency = false.obs;
  String? selectedDistrict;
  final errorDistrict = false.obs;
  String? selectedVillage;
  final errorVillage = false.obs;

  int index = 0;

  bool isValid() {
    var isValid = true;
    errorFirstName.value = false;
    errorLastName.value = false;
    errorBiodata.value = false;
    errorProvince.value = false;
    errorRegency.value = false;
    errorDistrict.value = false;
    errorVillage.value = false;

    if (firstName.text == '') {
      isValid = false;
      errorFirstName.value = true;
    }

    if (lastName.text == '') {
      isValid = false;
      errorLastName.value = true;
    }
    if (biodata.text == '') {
      isValid = false;
      errorBiodata.value = true;
    }
    if (selectedProvince == null) {
      isValid = false;
      errorProvince.value = true;
    }
    if (selectedRegency == null) {
      isValid = false;
      errorRegency.value = true;
    }
    if (selectedDistrict == null) {
      isValid = false;
      errorDistrict.value = true;
    }
    if (selectedVillage == null) {
      isValid = false;
      errorVillage.value = true;
    }

    return isValid;
  }

  void goContinue() {
    if (isValid()) {
      if (index < 2) {
        index += 1;
        update();
      }
    }
  }

  void goCancel() {
    if (index > 0) {
      index -= 1;
      update();
    }
  }

  void getProvince() async {
    final response = await network.getProvinces();
    dataProvinces.value = response;
    listProvinces.addAll(dataProvinces.map((data) => data.name!).toList());
  }

  void getRegency(String province) async {
    listRegency.value = RxList<String>([]);
    selectedRegency = null;
    listDistrict.value = RxList<String>([]);
    selectedDistrict = null;
    listVillage.value = RxList<String>([]);
    selectedVillage = null;
    var selectedProvince = dataProvinces.firstWhere(
      (data) => data.name == province,
    );
    var provinceId = selectedProvince.id;
    final response = await network.getRegency(provinceId);
    dataRegency.value = response;
    listRegency.addAll(dataRegency.map((data) => data.name!).toList());
  }

  void getDistrict(String regency) async {
    listDistrict.value = RxList<String>([]);
    selectedDistrict = null;
    listVillage.value = RxList<String>([]);
    selectedVillage = null;
    var selectedRegency = dataRegency.firstWhere(
      (data) => data.name == regency,
    );
    var regencyId = selectedRegency.id;
    final response = await network.getDistrict(regencyId);
    dataDistrict.value = response;
    listDistrict.addAll(dataDistrict.map((data) => data.name!).toList());
  }

  void getVillage(String district) async {
    listVillage.value = RxList<String>([]);
    selectedVillage = null;
    var selectedDistrict = dataDistrict.firstWhere(
      (data) => data.name == district,
    );
    var districtId = selectedDistrict.id;
    final response = await network.getVillage(districtId);
    dataVillage.value = response;
    listVillage.addAll(dataVillage.map((data) => data.name!).toList());
  }
}
