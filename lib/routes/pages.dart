// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/create_account/binding.dart';
import 'package:evita_ufg_app/app/modules/create_account/pages/create_account_page.dart';
import 'package:evita_ufg_app/app/modules/create_account/pages/terms_of_use_page.dart';
import 'package:evita_ufg_app/app/modules/create_evaluation/binding.dart';
import 'package:evita_ufg_app/app/modules/create_evaluation/page.dart';
import 'package:evita_ufg_app/app/modules/edit_evaluation/binding.dart';
import 'package:evita_ufg_app/app/modules/edit_evaluation/page.dart';
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
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.createAccount,
      binding: CreateAccountBinding(),
      page: () => CreateAccountPage(),
    ),
    GetPage(
      name: Routes.termsOfUse,
      page: () => const TermsOfUsePage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.teachers,
      binding: TeachersBinding(),
      page: () => TeachersPage(),
    ),
    GetPage(
      name: Routes.teacher,
      binding: TeacherBinding(),
      page: () => TeacherPage(),
    ),
    GetPage(
      name: Routes.createEvaluation,
      binding: CreateEvaluationBinding(),
      page: () => CreateEvaluationPage(),
    ),
    GetPage(
      name: Routes.editEvaluation,
      binding: EditEvaluationBinding(),
      page: () => EditEvaluationPage(),
    ),
  ];
}
