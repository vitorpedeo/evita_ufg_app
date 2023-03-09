// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:evita_ufg_app/app/data/services/theme.dart';
import 'package:evita_ufg_app/app/modules/home/controller.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/utils/string_utils.dart';

class HomeDrawer extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  final _authService = AuthService.instance;
  final _themeService = Get.find<ThemeService>();

  HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.8,
      backgroundColor: context.theme.colorScheme.background,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.theme.textTheme.bodyLarge!.color!,
                  ),
                ),
              ),
              child: Row(
                children: [
                  _authService.user.value?.avatarUrl != null
                      ? CachedNetworkImage(
                          imageUrl: _authService.user.value!.avatarUrl!,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              radius: 28,
                              backgroundImage: imageProvider,
                            );
                          },
                          placeholder: (context, url) {
                            return Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomTheme.accentColor,
                              ),
                              child: Center(
                                child: HeadingText(
                                  StringUtils.getFirstLetter(
                                    _authService.user.value!.name,
                                  ),
                                  color: CustomTheme.primaryColor,
                                  fontSize: 24,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomTheme.accentColor,
                              ),
                              child: Center(
                                child: HeadingText(
                                  StringUtils.getFirstLetter(
                                    _authService.user.value!.name,
                                  ),
                                  color: CustomTheme.primaryColor,
                                  fontSize: 24,
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomTheme.accentColor,
                          ),
                          child: Center(
                            child: HeadingText(
                              StringUtils.getFirstLetter(
                                _authService.user.value!.name,
                              ),
                              color: CustomTheme.primaryColor,
                              fontSize: 24,
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        _authService.user.value?.name ?? '---',
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      BodyText(
                        'Conta criada em ${_controller.formatAccountCreationDate(_authService.user.value?.createdAt)}',
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
                color: context.theme.textTheme.displayLarge?.color,
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
                      color: context.theme.textTheme.displayLarge?.color,
                      size: 28,
                    )
                  : Icon(
                      Icons.wb_sunny_rounded,
                      color: context.theme.textTheme.displayLarge?.color,
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
                color: context.theme.textTheme.displayLarge?.color,
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
