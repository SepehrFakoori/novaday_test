import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/back_button_widget.dart';
import 'package:novaday_test/core/widgets/icon_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    this.haveBackButton = true,
    required this.title,
    this.subtitle,
    this.buttonsList,
    super.key,
  });

  final bool haveBackButton;
  final String title;
  final String? subtitle;
  final List<IconButtonWidget>? buttonsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        children: [
          Offstage(
            offstage: !haveBackButton,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButtonWidget(),
                SizedBox(width: AppSpacing.sp8),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textTheme.titleLarge!.copyWith(
                    color: AppColors.lightTitleColor,
                  ),
                ),
                if (subtitle != null && subtitle!.isNotEmpty)
                  Text(
                    subtitle!,
                    style: AppTextStyles.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightSubtitleColor,
                    ),
                  ),
              ],
            ),
          ),
          if (buttonsList != null && buttonsList!.isNotEmpty)
            Row(
              children: [
                for (int i = 0; i < buttonsList!.length; i++) ...[
                  if (i > 0) const SizedBox(width: 12),
                  buttonsList![i],
                ],
              ],
            ),
        ],
      ),
    );
  }
}
