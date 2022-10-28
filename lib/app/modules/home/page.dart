// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/home/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/error_feedback.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Obx(
            () {
              if (_controller.isLoadingDepartments.value) {
                return _buildShimmer(context);
              }

              if (_controller.isError.value) {
                return _buildError();
              }

              return _buildPage(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 64,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 32,
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 24,
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
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
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ErrorFeedback(
          onRetry: () {
            _controller.getAllDepartments();
          },
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    bool isKeyboardOpen = Get.mediaQuery.viewInsets.bottom > 0;

    return Column(
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
        Obx(
          () => Row(
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
                child: SelectInput<String>(
                  selectedItem: _controller.selectedRegional.value,
                  items: _controller.regionalValues,
                  onChanged: (item) {
                    _controller.selectedRegional.value = item!;

                    _controller.handleFilter();
                  },
                  label: (item) => item,
                  hint: 'Região',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 24,
            ),
            child: ListView.separated(
              itemCount: _controller.filteredDepartments.length,
              itemBuilder: (context, index) {
                return AppCard(
                  icon: const Icon(
                    Icons.menu_book,
                    size: 24,
                    color: CustomTheme.primaryColor,
                  ),
                  title: _controller.filteredDepartments[index].name ?? '---',
                  subtitle: BodyText(
                    _controller.filteredDepartments[index].regional ?? '---',
                    fontSize: 10,
                  ),
                  onTap: () {
                    Get.toNamed('/teachers', arguments: {
                      'departmentName':
                          _controller.filteredDepartments[index].name,
                      'departmentId':
                          _controller.filteredDepartments[index].id.toString(),
                    });
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
    );
  }
}
