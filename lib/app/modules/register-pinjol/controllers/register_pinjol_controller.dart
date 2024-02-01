import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  String? selectedRegency;
  String? selectedDistrict;
  String? selectedVillage;
  final errorProvince = false.obs;
  final errorRegency = false.obs;
  final errorDistrict = false.obs;
  final errorVillage = false.obs;

  final resultName = ''.obs;
  final resultBio = ''.obs;
  final resultProvince = ''.obs;
  final resultRegency = ''.obs;
  final resultDistrict = ''.obs;
  final resultVillage = ''.obs;

  Rx<XFile?> ktpImage = Rx<XFile?>(null);
  Rx<XFile?> selfieImage = Rx<XFile?>(null);
  final errorKTP = false.obs;
  final errorSelfie = false.obs;

  int index = 0;

  bool isValidBiodata() {
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

  bool isValidFoto() {
    var isValid = true;
    errorKTP.value = false;
    errorSelfie.value = false;

    if (ktpImage.value == null) {
      isValid = false;
      errorKTP.value = true;
    }
    if (selfieImage.value == null) {
      isValid = false;
      errorSelfie.value = true;
    }

    return isValid;
  }

  void goFoto() {
    if (isValidBiodata()) {
      if (index < 2) {
        index += 1;
        update();
      }
    }
  }

  void goResult() {
    if (isValidFoto()) {
      if (index < 2) {
        index += 1;
        resultName.value = '${firstName.text} ${lastName.text}';
        resultBio.value = biodata.text;
        resultProvince.value = selectedProvince!;
        resultRegency.value = selectedRegency!;
        resultDistrict.value = selectedDistrict!;
        resultVillage.value = selectedVillage!;
        update();
      }
    }
  }

  void sendData() async {
    final response = await network.sendData(
      firstName: firstName.text,
      lastName: lastName.text,
      province: selectedProvince!,
      regency: selectedRegency!,
      district: selectedDistrict!,
      village: selectedVillage!,
      ktp: ktpImage.value != null ? File(ktpImage.value!.path) : File('null'),
      selfie: selfieImage.value != null
          ? File(selfieImage.value!.path)
          : File('null'),
    );
    print(response);
  }

  void goBack() {
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

  void getKTPImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? ktp = await picker.pickImage(source: ImageSource.gallery);
    ktpImage.value = ktp;
  }

  void getSelfieImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selfie = await picker.pickImage(source: ImageSource.gallery);
    selfieImage.value = selfie;
  }
}
