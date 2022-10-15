// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/home/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/select_input.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/utils/string_utils.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  final _storageService = Get.find<StorageService>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = Get.mediaQuery.viewInsets.bottom > 0;

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
              !isKeyboardOpen
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              _storageService.user.value?.avatarUrl != null
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        _storageService.user.value!.avatarUrl!,
                                      ),
                                    )
                                  : const CircleAvatar(
                                      backgroundColor: CustomTheme.accentColor,
                                      child: Icon(
                                        Icons.person,
                                        color: CustomTheme.primaryColor,
                                      ),
                                    ),
                              const SizedBox(
                                width: 8,
                              ),
                              const BodyText(
                                'Olá, ',
                                color: CustomTheme.primaryTextColor,
                              ),
                              BodyText(
                                StringUtils.getFirstName(
                                    _storageService.user.value?.name),
                                color: CustomTheme.primaryTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _controller.logout();
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(
                  top: !isKeyboardOpen ? 32 : 0,
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
                  Expanded(
                    child: TextInput(
                      hintText: 'Nome',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      onChanged: (value) {
                        _controller.departmentName.value = value;

                        _controller.handleFilter();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Obx(
                      () => !_controller.isLoadingDepartments.value
                          ? SelectInput<String>(
                              selectedItem: _controller.selectedRegional.value,
                              items: _controller.regionalValues,
                              onChanged: (item) {
                                _controller.selectedRegional.value = item!;

                                _controller.handleFilter();
                              },
                              label: (item) => item,
                              hint: 'Região',
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                  ),
                  child: Obx(
                    () => !_controller.isLoadingDepartments.value
                        ? ListView.separated(
                            itemCount: _controller.filteredDepartments.length,
                            itemBuilder: (context, index) {
                              return AppCard(
                                icon: const Icon(
                                  Icons.menu_book,
                                  size: 24,
                                  color: CustomTheme.primaryColor,
                                ),
                                title: _controller
                                        .filteredDepartments[index].name ??
                                    '---',
                                subtitle: BodyText(
                                  _controller.filteredDepartments[index]
                                          .regional ??
                                      '---',
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
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: CustomTheme.primaryColor,
                            ),
                          ),
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
