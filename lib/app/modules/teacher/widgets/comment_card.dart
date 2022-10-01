// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class CommentCard extends StatelessWidget {
  final int id;

  final bool isFromLoggedUser;

  const CommentCard(
      {super.key, required this.id, required this.isFromLoggedUser});

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      width: Get.width,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(237, 242, 247, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://github.com/vitorpedeo.png'),
                minRadius: 16,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      BodyText(
                        'Lima Mei',
                        color: CustomTheme.primaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: CustomTheme.yellowColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      BodyText(
                        '4,5',
                        color: CustomTheme.primaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const BodyText(
                    '29 de março de 2022, às 13:45',
                    fontSize: 10,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const BodyText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tempor mauris enim, vitae porttitor nulla tempus nec. Lorem ipsum dolor sit amet.',
            fontSize: 12,
            height: 1.5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isFromLoggedUser) {
      return Slidable(
        key: ValueKey(id),
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
                Get.toNamed('/edit-evaluation');
              },
            ),
          ],
        ),
        child: _buildCard(),
      );
    }

    return _buildCard();
  }
}
