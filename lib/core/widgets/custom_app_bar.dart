import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.centerTitle = false,
    this.haveBackButton = true,
    required this.title,
    this.subtitle,
    this.buttonsList,
    super.key,
  });

  final bool centerTitle;
  final bool haveBackButton;
  final String title;
  final String? subtitle;
  final List<CustomIconButton>? buttonsList;

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
                CustomIconButton(
                  icon: Icons.arrow_back_ios_rounded,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: AppSpacing.sp16),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: !centerTitle
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                if (subtitle != null && subtitle!.isNotEmpty)
                  Text(
                    subtitle!,
                    style: context.textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
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
