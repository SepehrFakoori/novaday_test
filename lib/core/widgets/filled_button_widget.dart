import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonState = ButtonStateEnum.deActive,
  });

  final String buttonText;
  final void Function() onPressed;
  final ButtonStateEnum buttonState;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: (buttonState == ButtonStateEnum.deActive) ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: (buttonState == ButtonStateEnum.deActive)
            ? AppColors.lightDeActiveButtonColor
            : AppColors.lightPrimaryColor,
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
              style: AppTextStyles.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: (buttonState == ButtonStateEnum.deActive)
                    ? AppColors.lightSubtitleColor
                    : AppColors.lightWhiteTextColor,
              ),
            ),
    );
  }
}
