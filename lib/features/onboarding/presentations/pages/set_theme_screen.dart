import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/widgets/custom_radio_button_widget.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/custom_app_bar_widget.dart';
import 'package:novaday_test/features/auth/presentations/pages/login_screen.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/language_cubit.dart';

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
                  CustomRadioButtonWidget(
                    title: context.localization.lightTheme,
                    value: null,
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: AppSpacing.sp8),
                  CustomRadioButtonWidget(
                    title: context.localization.darkTheme,
                    value: null,
                    groupValue: null,
                    onChanged: (value) {},
                  )
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
