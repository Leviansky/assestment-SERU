import 'package:get/get.dart';
import 'package:mobile_app/app/modules/register-pinjol/controllers/register_pinjol_controller.dart';

class RegisterPinjolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPinjolController>(
      () => RegisterPinjolController(),
    );
  }
}
