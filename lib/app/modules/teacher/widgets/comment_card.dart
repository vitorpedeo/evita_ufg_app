// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class CommentCard extends StatelessWidget {
  final CommentModel? comment;
  final bool isFromLoggedUser;
  final void Function() onEdit;
  final Future<void> Function() onDelete;

  const CommentCard({
    super.key,
    required this.comment,
    required this.isFromLoggedUser,
    required this.onDelete,
    required this.onEdit,
  });

  Widget _buildCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: context.theme.inputDecorationTheme.fillColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              comment?.user?.avatarUrl != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(comment!.user!.avatarUrl!),
                      minRadius: 16,
                    )
                  : const CircleAvatar(
                      backgroundColor: CustomTheme.accentColor,
                      minRadius: 16,
                      child: Icon(
                        Icons.person,
                        color: CustomTheme.primaryColor,
                      ),
                    ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BodyText(
                        comment?.user?.name ?? '---',
                        color: context.theme.textTheme.headline1?.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.star,
                        size: 18,
                        color: CustomTheme.yellowColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      BodyText(
                        comment?.rating.toString() ?? '---',
                        color: context.theme.textTheme.headline1?.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  BodyText(
                    comment?.updatedAt != null
                        ? DateFormat(
                                "dd 'de' MMMM 'de' yyyy, 'às' HH:mm", 'pt_BR')
                            .format(comment!.updatedAt!)
                        : '---',
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: BodyText(
                  comment?.content ?? '---',
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isFromLoggedUser) {
      return Slidable(
        key: ValueKey(comment?.id),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              backgroundColor: CustomTheme.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              onPressed: (context) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const HeadingText(
                        'Confirmar exclusão',
                        fontSize: 16,
                      ),
                      content: const BodyText(
                          'Tem certeza que deseja excluir sua avaliação?',
                          fontSize: 14),
                      actions: [
                        AppButton(
                          'Não',
                          minWidth: 100,
                          color: CustomTheme.redColor,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        AppButton(
                          'Sim',
                          minWidth: 100,
                          onPressed: () {
                            Get.back();

                            onDelete();
                          },
                        ),
                      ],
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actionsPadding: const EdgeInsets.only(
                        left: 24,
                        bottom: 24,
                        right: 24,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              backgroundColor: CustomTheme.primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              onPressed: (context) {
                onEdit();
              },
            ),
          ],
        ),
        child: _buildCard(context),
      );
    }

    return _buildCard(context);
  }
}
