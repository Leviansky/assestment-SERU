import 'package:get/get.dart';
import 'package:mobile_app/app/modules/register-pinjol/bindings/register_pinjol_binding.dart';

import '../../routes/app_pages.dart';
import 'views/register_pinjol_view.dart';

final registerPinjolPages = [
  GetPage(
    name: Routes.register,
    page: () => const RegisterPinjolView(),
    binding: RegisterPinjolBinding(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
];
