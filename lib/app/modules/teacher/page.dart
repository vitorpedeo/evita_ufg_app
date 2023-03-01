// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/teacher/controller.dart';
import 'package:evita_ufg_app/app/modules/teacher/widgets/comment_card.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/error_feedback.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/teacher_avatar.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/theme/shimmer_colors.dart';

class TeacherPage extends StatelessWidget {
  final _controller = Get.find<TeacherController>();
  final _storageService = Get.find<StorageService>();

  TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
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
              if (_controller.isLoadingTeacher.value) {
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
        Shimmer.fromColors(
          baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
          highlightColor:
              context.theme.extension<ShimmerColors>()!.highlightColor!,
          child: Container(
            width: 96,
            height: 48,
            decoration: BoxDecoration(
              color: context.theme.extension<ShimmerColors>()!.baseColor!,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 32,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
                highlightColor:
                    context.theme.extension<ShimmerColors>()!.highlightColor!,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.theme.extension<ShimmerColors>()!.baseColor!,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Shimmer.fromColors(
                baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
                highlightColor:
                    context.theme.extension<ShimmerColors>()!.highlightColor!,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: context.theme.extension<ShimmerColors>()!.baseColor!,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        context.theme.extension<ShimmerColors>()!.baseColor!,
                    highlightColor: context.theme
                        .extension<ShimmerColors>()!
                        .highlightColor!,
                    child: Container(
                      width: 160,
                      height: 16,
                      decoration: BoxDecoration(
                        color: context.theme
                            .extension<ShimmerColors>()!
                            .baseColor!,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        context.theme.extension<ShimmerColors>()!.baseColor!,
                    highlightColor: context.theme
                        .extension<ShimmerColors>()!
                        .highlightColor!,
                    child: Container(
                      width: 240,
                      height: 16,
                      decoration: BoxDecoration(
                        color: context.theme
                            .extension<ShimmerColors>()!
                            .baseColor!,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        context.theme.extension<ShimmerColors>()!.baseColor!,
                    highlightColor: context.theme
                        .extension<ShimmerColors>()!
                        .highlightColor!,
                    child: Container(
                      width: 160,
                      height: 20,
                      decoration: BoxDecoration(
                        color: context.theme
                            .extension<ShimmerColors>()!
                            .baseColor!,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Shimmer.fromColors(
          baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
          highlightColor:
              context.theme.extension<ShimmerColors>()!.highlightColor!,
          child: Container(
            width: 128,
            height: 20,
            decoration: BoxDecoration(
              color: context.theme.extension<ShimmerColors>()!.baseColor!,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor:
                      context.theme.extension<ShimmerColors>()!.baseColor!,
                  highlightColor:
                      context.theme.extension<ShimmerColors>()!.highlightColor!,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 120,
                    decoration: BoxDecoration(
                      color:
                          context.theme.extension<ShimmerColors>()!.baseColor!,
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
        Shimmer.fromColors(
          baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
          highlightColor:
              context.theme.extension<ShimmerColors>()!.highlightColor!,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: context.theme.extension<ShimmerColors>()!.baseColor!,
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
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
          onRetry: () {},
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    String evaluationsString = _controller.teacher.value?.evaluations == 1
        ? 'avaliação'
        : 'avaliações';

    return Column(
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
              TeacherAvatar(
                teacher: _controller.teacher.value,
                size: TeacherAvatarSize.large,
              ),
              const SizedBox(
                height: 12,
              ),
              HeadingText(
                _controller.teacher.value?.name ?? '---',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 2,
              ),
              BodyText(
                _controller.teacher.value?.email ?? '---',
                color: context.theme.textTheme.headline1?.color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              BodyText(
                _controller.teacher.value?.department?.name ?? '---',
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
                          text: '${_controller.teacher.value?.rating} ',
                          style: TextStyle(
                            color: context.theme.textTheme.headline1?.color,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text:
                              '(${_controller.teacher.value?.evaluations} $evaluationsString)',
                          style: TextStyle(
                            color: context.theme.textTheme.bodyText1?.color,
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
            child: _controller.teacher.value?.comments != null &&
                    _controller.teacher.value!.comments!.isNotEmpty
                ? ListView.separated(
                    itemCount: _controller.teacher.value?.comments?.length ?? 0,
                    itemBuilder: (context, index) {
                      bool isFromLoggedUser = _controller
                              .teacher.value?.comments?[index].user?.id ==
                          _storageService.user.value?.id;

                      return CommentCard(
                        comment: _controller.teacher.value?.comments?[index],
                        isFromLoggedUser: isFromLoggedUser,
                        onEdit: () {
                          Get.toNamed(
                            '/edit-evaluation',
                            arguments: {
                              'teacher': _controller.teacher.value,
                              'comment':
                                  _controller.teacher.value?.comments?[index],
                            },
                          );
                        },
                        onDelete: () async {
                          await _controller.deleteComment(
                            int.parse(_controller
                                .teacher.value!.comments![index].id!),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  )
                : const BodyText('Esse professor ainda não possui avaliações.'),
          ),
        ),
        Obx(() {
          bool userHaveCommented = _controller.teacher.value?.comments?.any(
                  (comment) =>
                      comment.user?.id == _storageService.user.value?.id) ??
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
    );
  }
}
