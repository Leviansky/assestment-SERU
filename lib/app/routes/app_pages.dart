import 'package:mobile_app/app/modules/register-pinjol/register_pinjol_pages.dart';
import 'package:mobile_app/app/modules/splash/splash_pages.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    ...splashPages,
    ...registerPinjolPages,
  ];
}
