import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/features/onboarding/domain/entities/user_entity/user_entity.dart';

class DashboardCustomAppBar extends StatefulWidget {
  const DashboardCustomAppBar({
    super.key,
  });

  @override
  State<DashboardCustomAppBar> createState() => _DashboardCustomAppBarState();
}

class _DashboardCustomAppBarState extends State<DashboardCustomAppBar> {
  UserEntity userEntity = UserEntity();

  @override
  initState() {
    super.initState();
    userEntity = getUserInfo();
  }

  UserEntity getUserInfo() {
    var box = Hive.box<UserEntity>(HiveBoxConstants.userProfileBox);
    UserEntity? user = box.get(HiveKeyConstants.userProfileKey);
    return user ?? UserEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: AppHeight.h40,
          child: Container(
            width: AppHeight.h40,
            height: AppHeight.h40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.outline,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppBorderRadius.br24),
              child: userEntity.profileImage == ""
                  ? Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.colorScheme.outline,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          userEntity.fullName![0].toUpperCase(),
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    )
                  : kIsWeb
                      ? Image.network(
                          userEntity.profileImage!,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(userEntity.profileImage!),
                          fit: BoxFit.cover,
                        ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sp12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userEntity.fullName!,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface,
              ),
            ),
            Text(
              userEntity.jobTitle!,
              style: context.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
