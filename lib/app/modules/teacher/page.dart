// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/teacher/controller.dart';
import 'package:evita_ufg_app/app/modules/teacher/widgets/comment_card.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/utils/string_utils.dart';

class TeacherPage extends StatelessWidget {
  final _controller = Get.find<TeacherController>();
  final _storageService = Get.find<StorageService>();

  TeacherPage({super.key});

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
            () => !_controller.isLoadingTeacher.value
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
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                color: CustomTheme.accentColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  StringUtils.getFirstLetter(
                                      _controller.teacher.value?.name),
                                  style: const TextStyle(
                                    color: CustomTheme.primaryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            HeadingText(
                              _controller.teacher.value?.name ?? '---',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            BodyText(
                              _controller.teacher.value?.email ?? '---',
                              color: CustomTheme.primaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BodyText(
                              _controller.teacher.value?.department?.name ??
                                  '---',
                              fontSize: 12,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: CustomTheme.yellowColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            '${_controller.teacher.value?.rating} ',
                                        style: const TextStyle(
                                          color: CustomTheme.primaryTextColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '(${_controller.teacher.value?.evaluations} avaliações)',
                                        style: const TextStyle(
                                          color: CustomTheme.secondaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const HeadingText(
                        'Avaliações',
                        fontSize: 14,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: ListView.separated(
                            itemCount:
                                _controller.teacher.value?.comments?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              bool isFromLoggedUser = _controller.teacher.value
                                      ?.comments?[index].user?.id ==
                                  _storageService.user.value?.id;

                              return CommentCard(
                                comment:
                                    _controller.teacher.value?.comments?[index],
                                isFromLoggedUser: isFromLoggedUser,
                                onDelete: () async {
                                  await _controller.deleteComment(
                                    _controller
                                        .teacher.value!.comments![index].id!,
                                  );
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 16,
                              );
                            },
                          ),
                        ),
                      ),
                      Obx(() {
                        bool userHaveCommented = _controller
                                .teacher.value?.comments
                                ?.any((comment) =>
                                    comment.user?.id ==
                                    _storageService.user.value?.id) ??
                            false;

                        if (userHaveCommented) {
                          return Container();
                        }

                        return AppButton(
                          'Avaliar',
                          onPressed: () {
                            Get.toNamed(
                              '/create-evaluation',
                              arguments: {
                                'teacher': _controller.teacher.value,
                              },
                            );
                          },
                        );
                      }),
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
