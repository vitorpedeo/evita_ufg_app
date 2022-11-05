// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/data/services/theme.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/routes/pages.dart';
import 'package:evita_ufg_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(EvitaUFGApp());
}

Future<void> initServices() async {
  await Get.putAsync(
    () => StorageService().init(),
  );
  await Get.putAsync(
    () => ThemeService().init(),
  );

  await initializeDateFormatting('pt_BR', null);
}

class EvitaUFGApp extends StatelessWidget {
  final StorageService _storageService = Get.find<StorageService>();

  EvitaUFGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Evita UFG',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute:
          _storageService.authenticated.value ? Routes.home : Routes.login,
      getPages: Pages.pages,
    );
  }
}
