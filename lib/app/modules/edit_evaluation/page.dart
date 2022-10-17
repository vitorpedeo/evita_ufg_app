// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/edit_evaluation/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/star_input.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/utils/string_utils.dart';

class EditEvaluationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _controller = Get.find<EditEvaluationController>();

  EditEvaluationPage({super.key});

  Future<void> _handleFormSubmit() async {
    _formKey.currentState!.save();

    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> formData = _formKey.currentState!.value;

      await _controller.handleEvaluationEdit(formData);
    }
  }

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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !isKeyboardOpen
                    ? Column(
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
                                          _controller.teacher?.name),
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
                                  _controller.teacher?.name ?? '---',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                BodyText(
                                  _controller.teacher?.email ?? '---',
                                  color: CustomTheme.primaryTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                BodyText(
                                  _controller.teacher?.department?.name ??
                                      '---',
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      )
                    : Container(),
                const HeadingText(
                  'Sua avaliação',
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilder(
                  key: _formKey,
                  initialValue: {
                    'rating': _controller.comment?.rating,
                    'content': _controller.comment?.content,
                  },
                  child: Column(
                    children: [
                      FormBuilderField<double>(
                        name: 'rating',
                        builder: (field) {
                          return StarInput(
                            initialValue: _controller.comment?.rating ?? 0,
                            onChanged: (rating) {
                              field.didChange(rating);
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderField<String>(
                        name: 'content',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }

                          return null;
                        },
                        builder: (field) {
                          return TextInput(
                            label: 'Comentário',
                            initialValue: _controller.comment?.content,
                            maxLines: 5,
                            textCapitalization: TextCapitalization.sentences,
                            errorText: field.errorText,
                            onChanged: ((value) => field.didChange(value)),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => AppButton(
                          'Confirmar',
                          isLoading: _controller.isLoadingEvaluationEdit.value,
                          onPressed: _handleFormSubmit,
                        ),
                      ),
                    ],
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
