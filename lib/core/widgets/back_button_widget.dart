import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/theme/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: AppHeight.h40,
        height: AppHeight.h40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.br12,
          ),
          color: AppColors.lightBgPrimaryColor,
          border: Border.all(
            color: AppColors.lightDefaultBorderColor,
            width: AppBorderWeight.sm,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.lightTitleColor,
            size: AppHeight.h16,
          ),
        ),
      ),
    );
  }
}
