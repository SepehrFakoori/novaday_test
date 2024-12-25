import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_icons.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/services/router_service.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/custom_app_bar_widget.dart';
import 'package:novaday_test/features/auth/presentations/cubits/login_cubit.dart';
import 'package:novaday_test/features/auth/presentations/widgets/phone_entry_text_field_widget.dart';
import 'package:novaday_test/features/auth/presentations/widgets/select_country_bottom_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: Column(
            children: [
              CustomAppBarWidget(
                  title: context.localization.loginRegisterTitle),
              const SizedBox(height: AppSpacing.sp24),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: context.width,
                  height: AppHeight.h48,
                  padding: const EdgeInsets.all(AppSpacing.sp4),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                    border: Border.all(
                      color: context.colorScheme.outline,
                      width: AppBorderWeight.sm,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: PhoneEntryTextFieldWidget(
                          controller: phoneController,
                          hintText: '9307894561',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sp8),
                      // todo: It was AppSpacing.sp16
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider(
                                create: (context) => LoginCubit(),
                                child: const SelectCountryBottomSheet(),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: AppHeight.h40,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sp16,
                            vertical: AppSpacing.sp8,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(
                              AppBorderRadius.br8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: AppHeight.h24,
                                color: context.colorScheme.onSurface,
                              ),
                              const SizedBox(width: AppSpacing.sp12),
                              Text("98+",
                                  style: AppTextStyles.textTheme.titleMedium),
                              const SizedBox(width: AppSpacing.sp12),
                              SvgPicture.asset(AppIcons.englandFlag),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButtonWidget(
        buttonText: context.localization.continueButtonTitle,
        buttonState: ButtonStateEnum.active,
        onPressed: () {
          RouterService.navigateTo(context, '/otp');
        },
      ),
    );
  }
}
