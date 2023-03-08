// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/home/controller.dart';
import 'package:evita_ufg_app/app/modules/home/widgets/home_drawer.dart';
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/error_feedback.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/select_input.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/theme/shimmer_colors.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = Get.find<HomeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
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
                  baseColor:
                      context.theme.extension<ShimmerColors>()!.baseColor!,
                  highlightColor:
                      context.theme.extension<ShimmerColors>()!.highlightColor!,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(26, 32, 44, 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Shimmer.fromColors(
                  baseColor:
                      context.theme.extension<ShimmerColors>()!.baseColor!,
                  highlightColor:
                      context.theme.extension<ShimmerColors>()!.highlightColor!,
                  child: Container(
                    width: 64,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(26, 32, 44, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
              highlightColor:
                  context.theme.extension<ShimmerColors>()!.highlightColor!,
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(26, 32, 44, 1),
                  borderRadius: BorderRadius.all(
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
            baseColor: context.theme.extension<ShimmerColors>()!.baseColor!,
            highlightColor:
                context.theme.extension<ShimmerColors>()!.highlightColor!,
            child: Container(
              height: 32,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(26, 32, 44, 1),
                borderRadius: BorderRadius.all(
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
              decoration: const BoxDecoration(
                color: Color.fromRGBO(26, 32, 44, 1),
                borderRadius: BorderRadius.all(
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
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(26, 32, 44, 1),
                    borderRadius: BorderRadius.all(
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
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(26, 32, 44, 1),
                      borderRadius: BorderRadius.all(
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
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.menu_rounded,
                      size: 32,
                      color: context.theme.textTheme.headline1?.color,
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
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: context.theme.textTheme.bodyText1?.color,
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
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomTheme.accentColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.menu_book,
                        size: 24,
                        color: CustomTheme.primaryColor,
                      ),
                    ),
                  ),
                  title: _controller.filteredDepartments[index].name ?? '---',
                  subtitle: BodyText(
                    _controller.filteredDepartments[index].regional ?? '---',
                    fontSize: 10,
                  ),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();

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
