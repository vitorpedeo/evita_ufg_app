// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/home/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/select_input.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.find<HomeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => !_controller.isLoadingUser.value
                        ? Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://github.com/vitorpedeo.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const BodyText(
                                'Olá,',
                                color: CustomTheme.primaryTextColor,
                              ),
                              BodyText(
                                _controller.user.value?.name ?? '',
                                color: CustomTheme.primaryTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.offAllNamed('/login');
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: CustomTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 32,
                ),
                child: const HeadingText(
                  'Departamentos',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 24,
                ),
                child: const BodyText(
                  'Selecione o departamento o qual o professor pertence.',
                ),
              ),
              Row(
                children: [
                  const Expanded(
                    child: TextInput(
                      hintText: 'Nome',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (_) {
                        return SelectInput<String>(
                          selectedItem: _.selectedValue,
                          items: _.selectValues,
                          onChanged: (item) {
                            _.updateSelectedValue(item);
                          },
                          label: (item) => item,
                          hint: 'Região',
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                  ),
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return AppCard(
                        icon: const Icon(
                          Icons.menu_book,
                          size: 24,
                          color: CustomTheme.primaryColor,
                        ),
                        title: 'CENTRO INTEGRADO DE APRENDIZAGEM EM REDE',
                        subtitle: const BodyText(
                          'Goiânia',
                          fontSize: 10,
                        ),
                        onTap: () {
                          Get.toNamed('/teachers');
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
