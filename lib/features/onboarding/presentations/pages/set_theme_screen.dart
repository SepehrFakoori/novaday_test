import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/custom_app_bar_widget.dart';
import 'package:novaday_test/features/auth/presentations/pages/login_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit.dart';

class SetThemeScreen extends StatelessWidget {
  const SetThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppLayoutGrid.margin,
            vertical: AppLayoutGrid.margin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(
                title: context.localization.setThemeTitle,
              ),
              const SizedBox(height: AppSpacing.sp24),
              Column(
                children: <Widget>[
                  _RadioContainer(
                    title: context.localization.lightTheme,
                    radioThemeMode: ThemeMode.light,
                  ),
                  const SizedBox(height: AppSpacing.sp8),
                  _RadioContainer(
                    title: context.localization.darkTheme,
                    radioThemeMode: ThemeMode.dark,
                  ),
                ],
              ),
              const Spacer(),
              FilledButtonWidget(
                buttonText: context.localization.continueButtonTitle,
                buttonState: ButtonStateEnum.active,
                onPressed: () {
                  onNextButtonClick(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNextButtonClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<LanguageCubit>(
              create: (context) {
                return LanguageCubit();
              },
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
    );
  }
}

class _RadioContainer extends StatelessWidget {
  _RadioContainer({
    required this.title,
    required this.radioThemeMode,
  });

  String title;
  ThemeMode radioThemeMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().changeTheme(themeMode: radioThemeMode);
          },
          child: Container(
            height: AppHeight.h48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.br12),
              color: context.colorScheme.secondary,
            ),
            child: Row(
              children: [
                Radio<ThemeMode>(
                  activeColor: context.colorScheme.primary,
                  value: radioThemeMode,
                  groupValue: context.read<ThemeCubit>().state,
                  onChanged: (ThemeMode? value) {
                    context.read<ThemeCubit>().changeTheme(themeMode: radioThemeMode);
                  },
                ),
                Text(
                  title,
                  style: AppTextStyles.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.onSecondary,
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
