import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonState = ButtonStateEnum.deActive,
  });

  final String buttonText;
  final void Function() onPressed;
  final ButtonStateEnum? buttonState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sp16),
      child: FilledButton(
        onPressed: (buttonState == ButtonStateEnum.deActive) ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: (buttonState == ButtonStateEnum.deActive)
              ? context.colorScheme.tertiaryContainer
              : context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          ),
          minimumSize: Size(context.width, AppHeight.h48),
        ),
        child: (buttonState == ButtonStateEnum.loading)
            ? const SizedBox.square(
                dimension: AppHeight.h24,
                child: CircularProgressIndicator(
                  strokeWidth: AppBorderWeight.lg2,
                ),
              )
            : Text(
                buttonText,
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  color: (buttonState == ButtonStateEnum.deActive)
                      ? context.colorScheme.onSecondaryContainer
                      : context.colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}
