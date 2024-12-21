import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/theme/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({required this.icon, this.onTap, super.key});

  final IconData icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Center(
          child: Icon(
            icon,
            color: AppColors.lightTitleColor,
            size: AppHeight.h16,
          ),
        ),
      ),
    );
  }
}
