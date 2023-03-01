// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/teachers/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/error_feedback.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/teacher_avatar.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/theme/shimmer_colors.dart';

class TeachersPage extends StatelessWidget {
  final _controller = Get.find<TeachersController>();

  TeachersPage({super.key});

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
              if (_controller.isLoadingTeachers.value) {
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
          child: Shimmer.fromColors(
            baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
            highlightColor:
                context.theme.extension<ShimmerColors>()!.highlightColor!,
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                color: context.theme.extension<ShimmerColors>()!.baseColor!,
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
        ),
        Row(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
                highlightColor:
                    context.theme.extension<ShimmerColors>()!.highlightColor!,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.theme.extension<ShimmerColors>()!.baseColor!,
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
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
                    height: 80,
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
      ],
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ErrorFeedback(
          onRetry: () {
            _controller.getTeachers();
          },
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    String teachersNumberString =
        _controller.allTeachers.length == 1 ? 'professor' : 'professores';

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
              children: _controller.allTeachers.isNotEmpty
                  ? [
                      const TextSpan(
                        text: 'O departamento ',
                      ),
                      TextSpan(
                        text: _controller.departmentName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' possui ',
                      ),
                      TextSpan(
                        text:
                            '${_controller.allTeachers.length} $teachersNumberString.',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]
                  : [
                      const TextSpan(
                        text: 'O departamento ',
                      ),
                      TextSpan(
                        text: _controller.departmentName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' não possui professores.',
                      ),
                    ],
            ),
          ),
        ),
        _controller.allTeachers.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: TextInput(
                      hintText: 'Nome',
                      onChanged: (value) {
                        _controller.teacherName.value = value;

                        _controller.handleFilter();
                      },
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: context.theme.textTheme.bodyText1?.color,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 24,
            ),
            child: ListView.separated(
              itemCount: _controller.filteredTeachers.length,
              itemBuilder: (context, index) {
                return AppCard(
                  leading: TeacherAvatar(
                    teacher: _controller.filteredTeachers[index],
                  ),
                  title: _controller.filteredTeachers[index].name ?? '---',
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
                              style: TextStyle(
                                color: context.theme.textTheme.headline1?.color,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '(${_controller.filteredTeachers[index].evaluations.toString()})',
                              style: TextStyle(
                                color: context.theme.textTheme.bodyText1?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(
                      '/teacher',
                      arguments: {
                        'teacherId':
                            _controller.filteredTeachers[index].id.toString(),
                        'teacher': _controller.filteredTeachers[index],
                      },
                    );
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
