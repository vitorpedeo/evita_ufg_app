// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/create_account/binding.dart';
import 'package:evita_ufg_app/app/modules/create_account/page.dart';
import 'package:evita_ufg_app/app/modules/login/binding.dart';
import 'package:evita_ufg_app/app/modules/login/page.dart';
import 'package:evita_ufg_app/routes/routes.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.createAccount,
      binding: CreateAccountBinding(),
      page: () => CreateAccountPage(),
    ),
  ];
}
