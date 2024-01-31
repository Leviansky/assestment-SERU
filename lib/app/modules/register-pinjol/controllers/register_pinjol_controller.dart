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

  String? selectedProvince;
  String? selectedRegency;
  String? selectedDistrict;
  String? selectedVillage;

  int index = 0;

  void goContinue() {
    if (index < 2) {
      index += 1;
      update();
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
