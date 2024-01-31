import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/register-pinjol/views/register_pinjol_step1_view.dart';

class RegisterPinjolController extends GetxController {
  static RegisterPinjolController get to => Get.find();

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
}
