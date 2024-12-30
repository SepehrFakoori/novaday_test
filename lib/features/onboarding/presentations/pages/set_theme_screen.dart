import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/theme_cubit/theme_cubit.dart';

class SetThemeScreen extends StatelessWidget {
  const SetThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeEnum themeGroupValue = context.watch<ThemeCubit>().state;

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
              CustomAppBar(
                title: context.localization.setThemeTitle,
              ),
              const SizedBox(height: AppSpacing.sp24),
              Column(
                children: <Widget>[
                  CustomRadioButton(
                    title: context.localization.lightTheme,
                    value: ThemeEnum.light,
                    groupValue: themeGroupValue,
                    onChanged: (value) {
                      onChangeButton(context, value);
                    },
                  ),
                  const SizedBox(height: AppSpacing.sp8),
                  CustomRadioButton(
                    title: context.localization.darkTheme,
                    value: ThemeEnum.dark,
                    groupValue: themeGroupValue,
                    onChanged: (value) {
                      onChangeButton(context, value);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFilledButton(
        buttonText: context.localization.continueButtonTitle,
        buttonState: ButtonStateEnum.active,
        onPressed: () {
          onNextButtonClick(context);
        },
      ),
    );
  }

  void onChangeButton(BuildContext context, ThemeEnum themeEnum) {
    context.read<ThemeCubit>().changeTheme(themeEnum: themeEnum);
  }

  void onNextButtonClick(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
