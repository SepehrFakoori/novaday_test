import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/cubits/filled_button_widget_cubit.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed
  });

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonStateEnum>(
      builder: (context, state) {
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: (state == ButtonStateEnum.deActive)
                ? AppColors.lightDeActiveButtonColor
                : AppColors.lightPrimaryColor,
            fixedSize: Size(AppSizes.phoneWidth, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: (state == ButtonStateEnum.loading)
              ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          )
              : Text(
            buttonText,
            style: AppTextStyles.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: (state == ButtonStateEnum.deActive)
                  ? AppColors.lightSubtitleColor
                  : AppColors.lightWhiteTextColor,
            ),
          ),
        );
      },
    );
  }
}
