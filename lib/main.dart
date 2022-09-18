import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:evita_ufg_app/routes/pages.dart';
import 'package:evita_ufg_app/routes/routes.dart';

class EvitaUFGApp extends StatelessWidget {
  const EvitaUFGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Evita UFG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.login,
      getPages: Pages.pages,
    );
  }
}

void main() {
  runApp(const EvitaUFGApp());
}
