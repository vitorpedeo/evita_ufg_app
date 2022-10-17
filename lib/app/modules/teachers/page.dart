// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/teachers/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/utils/string_utils.dart';

class TeachersPage extends StatelessWidget {
  final _controller = Get.find<TeachersController>();

  TeachersPage({super.key});

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
            () => !_controller.isLoadingTeachers.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.keyboard_backspace_outlined,
                              size: 24,
                            ),
                            label: const BodyText(
                              'Voltar',
                              color: CustomTheme.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 32,
                        ),
                        child: const HeadingText(
                          'Professores',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 24,
                        ),
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              color: CustomTheme.secondaryTextColor,
                              fontSize: 14,
                            ),
                            children: [
                              const TextSpan(
                                text: 'O departamento ',
                              ),
                              TextSpan(
                                text: _controller.departmentName.value,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
                                text: ' possui ',
                              ),
                              TextSpan(
                                text:
                                    '${_controller.allTeachers.length} professores.',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextInput(
                              hintText: 'Nome',
                              onChanged: (value) {
                                _controller.teacherName.value = value;

                                _controller.handleFilter();
                              },
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 20,
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
                            itemCount: _controller.filteredTeachers.length,
                            itemBuilder: (context, index) {
                              return AppCard(
                                icon: HeadingText(
                                  StringUtils.getFirstLetter(
                                      _controller.filteredTeachers[index].name),
                                  color: CustomTheme.primaryColor,
                                  fontSize: 20,
                                ),
                                title:
                                    _controller.filteredTeachers[index].name ??
                                        '---',
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: CustomTheme.yellowColor,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${_controller.filteredTeachers[index].rating.toString()} ',
                                            style: const TextStyle(
                                              color:
                                                  CustomTheme.primaryTextColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '(${_controller.filteredTeachers[index].evaluations.toString()})',
                                            style: const TextStyle(
                                              color: CustomTheme
                                                  .secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Get.toNamed('/teacher', arguments: {
                                    'teacherId': _controller
                                        .filteredTeachers[index].id
                                        .toString(),
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
                  )
                : Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
