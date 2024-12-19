import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/enums/theme_enum.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetThemeScreen extends StatelessWidget {
  const SetThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: AppSizes.phoneWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.setThemeTitle,
                  style: AppTextStyles.textTheme.titleLarge!.copyWith(
                    color: AppColors.lightTitleColor,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: <Widget>[
                    _RadioContainer(
                      title: localization.lightTheme,
                      theme: ThemeEnum.light,
                    ),
                    const SizedBox(height: 8),
                    _RadioContainer(
                      title: localization.darkTheme,
                      theme: ThemeEnum.dark,
                    ),
                  ],
                ),
                const Spacer(),
                FilledButtonWidget(
                  buttonText: localization.continueButtonTitle,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadioContainer extends StatelessWidget {
  const _RadioContainer({
    required this.title,
    required this.theme,
    super.key,
  });

  final String title;
  final ThemeEnum theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeEnum>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().setTheme(theme);
          },
          child: Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.lightBgSecondaryColor,
            ),
            child: Row(
              children: [
                Radio<ThemeEnum>(
                  activeColor: AppColors.lightPrimaryColor,
                  value: theme,
                  groupValue: context.read<ThemeCubit>().myTheme,
                  onChanged: (ThemeEnum? theme) {
                    context.read<ThemeCubit>().setTheme(theme!);
                  },
                ),
                Text(
                  title,
                  style: AppTextStyles.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightTitleColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
