// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/create_account/binding.dart';
import 'package:evita_ufg_app/app/modules/create_account/page.dart';
import 'package:evita_ufg_app/app/modules/home/binding.dart';
import 'package:evita_ufg_app/app/modules/home/page.dart';
import 'package:evita_ufg_app/app/modules/login/binding.dart';
import 'package:evita_ufg_app/app/modules/login/page.dart';
import 'package:evita_ufg_app/app/modules/teacher/binding.dart';
import 'package:evita_ufg_app/app/modules/teacher/page.dart';
import 'package:evita_ufg_app/app/modules/teachers/binding.dart';
import 'package:evita_ufg_app/app/modules/teachers/page.dart';
import 'package:evita_ufg_app/routes/routes.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.createAccount,
      binding: CreateAccountBinding(),
      page: () => const CreateAccountPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.teachers,
      binding: TeachersBinding(),
      page: () => const TeachersPage(),
    ),
    GetPage(
      name: Routes.teacher,
      binding: TeacherBinding(),
      page: () => const TeacherPage(),
    ),
  ];
}
