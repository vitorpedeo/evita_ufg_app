// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/data/services/theme.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/firebase_options.dart';
import 'package:evita_ufg_app/routes/pages.dart';
import 'package:evita_ufg_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  await initAsyncServices();

  runApp(const EvitaUFGApp());
}

void initServices() {
  Get.lazyPut(
    () => StorageService(),
    fenix: true,
  );
  Get.lazyPut(
    () => AuthService(),
    fenix: true,
  );
}

Future<void> initAsyncServices() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await StorageService.instance.initStorage();

  await Get.putAsync(
    () => ThemeService().init(),
  );

  await initializeDateFormatting('pt_BR', null);
}

class EvitaUFGApp extends StatelessWidget {
  const EvitaUFGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Evita UFG',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: StorageService.instance.authenticated.value
          ? Routes.home
          : Routes.login,
      getPages: Pages.pages,
    );
  }
}
