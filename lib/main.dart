import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/routes/pages.dart';
import 'package:evita_ufg_app/routes/routes.dart';

class EvitaUFGApp extends StatelessWidget {
  const EvitaUFGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Evita UFG',
      theme: ThemeData(
        fontFamily: CustomTheme.fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomTheme.primaryColor,
          secondary: CustomTheme.accentColor,
        ),
      ),
      initialRoute: Routes.login,
      getPages: Pages.pages,
    );
  }
}

void main() {
  runApp(const EvitaUFGApp());
}
