// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/routes/pages.dart';
import 'package:evita_ufg_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const EvitaUFGApp());
}

Future<void> initServices() async {
  await Get.putAsync(
    () => StorageService().init(),
  );
}

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
      initialRoute: Get.find<StorageService>().authenticated.value
          ? Routes.home
          : Routes.login,
      getPages: Pages.pages,
    );
  }
}
