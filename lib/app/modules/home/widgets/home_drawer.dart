import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/data/services/theme.dart';
import 'package:evita_ufg_app/app/modules/home/controller.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:get/get.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  final _storageService = Get.find<StorageService>();
  final _themeService = Get.find<ThemeService>();

  HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.backgroundColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.theme.textTheme.bodyText1!.color!,
                  ),
                ),
              ),
              child: Row(
                children: [
                  _storageService.user.value?.avatarUrl != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                            _storageService.user.value!.avatarUrl!,
                          ),
                          minRadius: 28,
                        )
                      : const CircleAvatar(
                          backgroundColor: CustomTheme.accentColor,
                          minRadius: 28,
                          child: Icon(
                            Icons.person,
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        _storageService.user.value?.name ?? '---',
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      BodyText(
                        'Conta criada em ${_controller.formatAccountCreationDate(_storageService.user.value?.createdAt)}',
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: context.theme.textTheme.headline1?.color,
                size: 28,
              ),
              title: const BodyText(
                'Minha conta',
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
            ),
            ListTile(
              onTap: () {
                _themeService.changeThemeMode();
              },
              leading: _themeService.isDarkMode.value
                  ? Icon(
                      Icons.nightlight_round,
                      color: context.theme.textTheme.headline1?.color,
                      size: 28,
                    )
                  : Icon(
                      Icons.wb_sunny_rounded,
                      color: context.theme.textTheme.headline1?.color,
                      size: 28,
                    ),
              title: const BodyText(
                'Trocar tema atual',
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
            ),
            ListTile(
              onTap: () {
                _controller.logout();
              },
              leading: Icon(
                Icons.logout_rounded,
                color: context.theme.textTheme.headline1?.color,
                size: 28,
              ),
              title: const BodyText(
                'Sair',
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
