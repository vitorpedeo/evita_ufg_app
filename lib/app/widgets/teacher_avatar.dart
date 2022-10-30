// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:evita_ufg_app/core/utils/string_utils.dart';

enum TeacherAvatarSize {
  normal,
  large,
}

class TeacherAvatar extends StatelessWidget {
  final TeacherModel? teacher;
  final TeacherAvatarSize? size;

  const TeacherAvatar({
    super.key,
    required this.teacher,
    this.size = TeacherAvatarSize.normal,
  });

  @override
  Widget build(BuildContext context) {
    if (teacher?.imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: teacher!.imageUrl!,
        imageBuilder: (context, imageProvider) {
          return CircleAvatar(
            radius: size == TeacherAvatarSize.normal ? 24 : 32,
            backgroundImage: imageProvider,
          );
        },
        placeholder: (context, url) {
          return Container(
            width: size == TeacherAvatarSize.normal ? 48 : 64,
            height: size == TeacherAvatarSize.normal ? 48 : 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomTheme.accentColor,
            ),
            child: Center(
              child: HeadingText(
                StringUtils.getFirstLetter(
                  teacher!.name,
                ),
                color: CustomTheme.primaryColor,
                fontSize: size == TeacherAvatarSize.normal ? 20 : 24,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            width: size == TeacherAvatarSize.normal ? 48 : 64,
            height: size == TeacherAvatarSize.normal ? 48 : 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomTheme.accentColor,
            ),
            child: Center(
              child: HeadingText(
                StringUtils.getFirstLetter(
                  teacher!.name,
                ),
                color: CustomTheme.primaryColor,
                fontSize: size == TeacherAvatarSize.normal ? 20 : 24,
              ),
            ),
          );
        },
      );
    }

    return Container(
      width: size == TeacherAvatarSize.normal ? 48 : 64,
      height: size == TeacherAvatarSize.normal ? 48 : 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: CustomTheme.accentColor,
      ),
      child: Center(
        child: HeadingText(
          StringUtils.getFirstLetter(
            teacher?.name,
          ),
          color: CustomTheme.primaryColor,
          fontSize: size == TeacherAvatarSize.normal ? 20 : 24,
        ),
      ),
    );
  }
}
