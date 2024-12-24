import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/services/router_service.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/icon_button_widget.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButtonWidget(
                  icon: Icons.arrow_back_ios_rounded,
                  onTap: () {
                    RouterService.pop(context);
                  },
                ),
                const SizedBox(width: AppSpacing.sp16),
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
                    color: context.colorScheme.onSurface,
                  ),
                ),
                if (subtitle != null && subtitle!.isNotEmpty)
                  Text(
                    subtitle!,
                    style: AppTextStyles.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
              ],
            ),
          ),
          if (buttonsList != null && buttonsList!.isNotEmpty)
            Row(
              children: [
                for (int i = 0; i < buttonsList!.length; i++) ...[
                  if (i > 0) const SizedBox(width: AppSpacing.sp8),
                  buttonsList![i],
                ],
              ],
            ),
        ],
      ),
    );
  }
}
